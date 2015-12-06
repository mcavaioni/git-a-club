require 'spec_helper'
RSpec.describe Club do
  after (:each) do
    GenericClub.destroy_all
  end

  describe 'validation' do
    context 'club set has all male and all righty clubs' do
      let(:club1) {FactoryGirl.create :club}
      let(:generic_club1) = {FactoryGirl.create:generic_club, club_type: 'putter'}
      let(:club2) {FactoryGirl.build :club}
      let(:generic_club2) {FactoryGirl.build :generic_club, club_type: 'pitch_wedge'}
      let(:club3) {FactoryGirl.build :club}
      let(:generic_club3) {FactoryGirl.build :generic_club, club_type: '2_iron_or_hybrid'}
      let(:club4) {FactoryGirl.build :club}
      let(:generic_club4) {FactoryGirl.build :generic_club, club_type: '6_iron'}
      let(:club5) {FactoryGirl.build :club}
      let(:generic_club5) {FactoryGirl.build :generic_club, club_type: '8_iron'}
      let(:club6) {FactoryGirl.build :club}
      let(:generic_club6) {FactoryGirl.build :generic_club, club_type: '3_wood'}
      let(:club7) {FactoryGirl.build :club}
      let(:generic_club7) {FactoryGirl.build :generic_club, club_type: '4_iron_or_hybrid'}
      let(:club8) {FactoryGirl.build :club}
      let(:generic_club8) {FactoryGirl.build :generic_club, club_type: '9_iron'}
      it 'is valid' do
        
      end
    end
  end

end
