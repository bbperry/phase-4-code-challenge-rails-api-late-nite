class AppearanceSerializer < ActiveModel::Serializer
  attributes :id, :rating
  has_one :guest
  has_one :episode
end
