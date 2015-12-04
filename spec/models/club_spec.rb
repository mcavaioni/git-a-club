require 'spec_helper'
RSpec.describe Club do
  after (:each) do
    GenericClub.destroy_all
  end
  describe "#condition" do
    context 'expect condition to be "good"' do
      let(:club) {FactoryGirl.build :club}
      it 'has a condition of good' do
        expect(club.condition).to eq('good')
      end
    end
  end

  describe "#generic_club" do
    context 'new golf club being created has generic club attributes'
    let(:generic_club) {FactoryGirl.build :generic_club}
    let(:club) {FactoryGirl.build :club}
    it "it should belong to an existing generic club if all of the generic club attributes are the same" do
      generic_club.save
      club.generic_club_attributes=generic_club.attributes
      expect(club.generic_club_id).to eq(generic_club.id)
  end

  # describe "create a generic club if one does not already exist with new club's parameters"
  #   context 'generic club attributes of a new club does not exist on creation'
  #   let(:generic_club_existing) {FactoryGirl.build :generic_club})
  #   let(:generic_club_new) {FactoryGirl.build :generic_club, righty: false})
  #   let(:club) {FactoryGirl.build :club}
  #   it "should create a new generic club" do
  #     generic_club.save
  #     last_id = generic_club.id
  #     club.generic_club_attributes = generic_club_new.attributes
  #     club.save
  #     expect(club.generic_club_id).to eq(last_id + 1)
  #   end
  end
end
