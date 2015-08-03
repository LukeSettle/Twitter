class UserSerializer < ActiveModel::Serializer
  attributes :email
  has_many :followers
  has_many :all_follows
end
