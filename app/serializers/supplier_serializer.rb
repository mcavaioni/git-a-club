class SupplierSerializer < ActiveModel::Serializer
  attributes :id, :user_id
  has_many :clubs
  has_many :club_sets

  # def attributes
  #   data = super
  #   binding.pry
  #   data[:club_sets] = object.club_sets.active_model_serializers
  #   data
  # end

end
