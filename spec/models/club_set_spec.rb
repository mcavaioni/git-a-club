require 'spec_helper'
RSpec.describe ClubSet do
  # after (:each) do
  #   GenericClub.destroy_all
  # end

  describe 'a club_set with 16 clubs' do
    let (:club_set) {FactoryGirl.build :club_set}
    clubs = GenericClub::ClubTypes.collect do |club_type|
      gen_club = FactoryGirl.create :generic_club, club_type: club_type
      FactoryGirl.create :club, generic_club_id: gen_club.id
    end

    context 'club set has all male and all righty clubs' do
      it 'has 16 clubs' do
        club_set.clubs << clubs
        expect(club_set.clubs.length).to eq 16
      end

      it "is valid when all clubs are men's righty clubs" do
        club_set.clubs << clubs
        expect(club_set).to be_valid
      end
    end

    context "club_set's clubs are not all of the same gender" do
      it 'is not valid because all clubs are not the same gender' do
        clubs.first.generic_club.male = false
        club_set.clubs << clubs
        expect(club_set).not_to be_valid
      end
    end

    context "club_set's clubs are not all of the same hand" do
      it 'is not valid because all clubs are not the same hand' do
        clubs.first.generic_club.male = true
        clubs.first.generic_club.righty = false
        club_set.clubs << clubs
        expect(club_set).not_to be_valid
      end
    end

  end

end
