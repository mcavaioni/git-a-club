class ClubSerializer < ActiveModel::Serializer
  attributes :id, :condition
  has_one :generic_club
end
