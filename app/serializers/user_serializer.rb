class UserSerializer < ActiveModel::Serializer
  attributes :email, :followers, :all_follows
  has_many :tweets
end
