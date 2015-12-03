# == Schema Information
#
# Table name: generic_clubs
#
#  id              :integer          not null, primary key
#  club_type       :string
#  brand           :string
#  male            :boolean
#  righty          :boolean
#  head_feature    :string
#  shaft_stiffness :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class GenericClubTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
