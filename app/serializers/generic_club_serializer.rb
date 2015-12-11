class GenericClubSerializer < ActiveModel::Serializer
  attributes :id, :club_type, :brand, :male, :righty, :head_feature, :shaft_stiffness
end
