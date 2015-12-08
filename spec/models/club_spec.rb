# == Schema Information
#
# Table name: clubs
#
#  id              :integer          not null, primary key
#  supplier_id     :integer
#  generic_club_id :integer
#  condition       :string
#  picture         :string
#  active          :boolean          default(TRUE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'
RSpec.describe Club do
  after (:each) do
    GenericClub.destroy_all
  end
  describe "#condition" do
    context 'expect condition to be "good"' do
      let(:club) {FactoryGirl.create :club}
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
  end

  describe "create a generic club if one does not already exist with new club's parameters" do
    context 'generic club attributes of a new club does not exist on creation'
    let(:generic_club_existing) {FactoryGirl.build :generic_club}
    let(:generic_club_new) {FactoryGirl.build :generic_club, righty: false}
    let(:club) {FactoryGirl.build :club}
    it "should create a new generic club" do
      generic_club_existing.save
      last_id = generic_club_existing.id
      club.generic_club_attributes = generic_club_new.attributes
      club.save
      expect(club.generic_club_id).to eq(last_id + 1)
    end
  end

  describe '#description' do
    let(:generic_club) {FactoryGirl.build :generic_club}
    let(:club) {FactoryGirl.build :club}
    it "club should know it's description" do
      generic_club.save
      club.generic_club_id = generic_club.id
      club.save
      expect(club.description).to eq("nike driver (M:R)")
    end
  end

end
