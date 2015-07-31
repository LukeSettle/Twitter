class TweetSerializer < ActiveModel::Serializer
  attributes :body, :user_id
end
