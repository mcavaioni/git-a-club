# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  provider        :string
#  uid             :string
#  address         :string
#  email           :string
#  phone_number    :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_many :providers
  has_many :renters
  has_many :listings, through: :providers
  has_many :reservations, through: :renters

end
