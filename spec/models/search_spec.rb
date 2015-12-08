require 'spec_helper'

RSpec.describe Search do
  describe '#sanitize_search_params' do
    search_params = {"male"=>"true",
     "righty"=>"true",
     "club_type"=>["driver", ""],
     "head_feature"=>[""],
     "shaft_stiffness"=>[""]}
    search_type = "club"
    it 'should sanitize search params for mass-assignment find' do
      new_search = Search.new(search_type,search_params)
      expected_hash = {"male"=>"true", "righty"=>"true", "club_type"=>["driver"]}
      expect(new_search.sanitize_search_params).to eq expected_hash
    end
  end

  let(:generic_driver) {FactoryGirl.create :generic_club}
  let(:generic_putter) {FactoryGirl.create :generic_club, club_type: 'putter'}
  let(:my_first_driver) {FactoryGirl.create :club}
  let(:my_second_driver) {FactoryGirl.create :club}
  let(:my_first_putter) {FactoryGirl.create :club}
  let(:listing_for_first_driver) {FactoryGirl.create :listing, listable_type: 'club'}
  let(:listing_for_second_driver) {FactoryGirl.create :listing, listable_type: 'club'}
  let(:listing_for_first_putter) {FactoryGirl.create :listing, listable_type: 'club'}
  describe '#get_results' do
    it 'expects true to be true' do
      my_first_driver.generic_club_id = generic_driver.id
      my_first_driver.save
      my_second_driver.generic_club_id = generic_driver.id
      my_second_driver.save
      my_first_putter.generic_club_id = generic_putter.id
      my_first_putter.save
      listing_for_first_driver.listable_id = my_first_driver.id
      listing_for_first_driver.save
      listing_for_second_driver.listable_id = my_second_driver.id
      listing_for_second_driver.save
      listing_for_first_putter.listable_id = my_first_putter.id
      listing_for_first_putter.save
      search_params = {"male"=>"true",
         "righty"=>"true",
         "club_type"=>["driver", ""],
         "head_feature"=>[""],
         "shaft_stiffness"=>[""]}
      search_type = 'club'
      search = Search.new(search_params,search_params)
      search.get_results
    end
  end
end
