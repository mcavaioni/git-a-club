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



    describe '#required_wedges' do 

   context "club_set must have at least 1 wedge" do

    clubs_without_wedges = %w(driver putter 2_iron_or_hybrid 3_iron_or_hybrid 4_iron_or_hybrid 5_iron_or_hybrid 6_iron 7_iron 8_iron 9_iron 3_wood 5_wood)
      let (:club_set) {FactoryGirl.build :club_set}
    checker = clubs_without_wedges.collect do |club_type|
      
      gen_club = FactoryGirl.create :generic_club, club_type: club_type
    
      FactoryGirl.create :club, generic_club_id: gen_club.id
    end



    it "is not valid without at least 1 wedge" do 
      full_set = club_set.clubs << checker
      
        expect(full_set).to_not be_valid
      end
    end
  end
end

  

end
