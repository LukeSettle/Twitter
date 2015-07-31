class UserSerializer < ActiveModel::Serializer
  attributes :email, :followers
end
