class UserSerializer < ActiveModel::Serializer
  attributes :email, :followers, :all_follows, :tweets
end
