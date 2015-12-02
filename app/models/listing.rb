class Listing < ActiveRecord::Base
   belongs_to :listable, polymorphic: true
   has_many :reservations
   has_many :reviews, as: :reviewable
end
