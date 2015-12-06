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
#  picture         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base

  has_one :supplier
  has_one :renter
  # has_many :listings, through: :providers
  # has_many :reservations, through: :renters
  validates :first_name, :last_name, :email, presence: true
  has_secure_password

  def qualified_supplier?
    self.address && self.phone_number
  end
end
