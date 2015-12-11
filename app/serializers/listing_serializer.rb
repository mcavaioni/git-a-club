class ListingSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :finish_date, :price, :active
  has_one :listable

end
