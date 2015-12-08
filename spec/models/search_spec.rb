# require 'spec_helper'
#
# RSpec.describe Search do
#   let(:generic_driver) {FactoryGirl.create :generic_club}
#   let(:generic_putter) {FactoryGirl.create :generic_club, club_type: 'putter'}
#   let(:my_first_driver) {FactoryGirl.create :club}
#   let(:my_second_driver) {FactoryGirl.create :club}
#   let(:my_first_putter) {FactoryGirl.create :club}
#   let(:listing_for_first_driver) {FactoryGirl.create :listing}
#   let(:listing_for_second_driver) {FactoryGirl.create :listing}
#   let(:listing_for_first_putter) {FactoryGirl.create :listing}
#   describe '#get_results' do
#     it 'expects true to be true' do
#       my_first_driver.generic_club = generic_driver
#       my_second_driver.generic_club = generic_driver
#       my_first_putter.generic_club = generic_putter
#       expect(true).to be true
#     end
#   end
# end
