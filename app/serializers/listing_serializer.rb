class ListingSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :finish_date, :price, :active

  def attributes
    data = super
    data[:description] = object.listable.description
    data
  end

  has_one :listable

end
