require 'spec_helper'
RSpec.describe Club do
  after (:each) do
    GenericClub.destroy_all
  end

  describe 'validation' do
    let (:club_set) {FactoryGirl.create :club_set}
    context 'club set has all male and all righty clubs' do
      clubs = GenericClub::ClubTypes.collect do |club_type|
        gen_club = FactoryGirl.create :generic_club, club_type: club_type
        FactoryGirl.create :club, generic_club_id: gen_club.id
      end
      it 'has 16 clubs' do
        club_set.clubs << clubs
        expect(club_set.clubs.length).to eq 16
      end
      # it 'is valid' do
      #   club_set.clubs << generic_clubs
      # end

    end
  end

end
