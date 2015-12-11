class ClubSetSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :clubs
end
