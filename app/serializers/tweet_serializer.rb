class TweetSerializer < ActiveModel::Serializer
  attributes :body, :user_id, :created_at
end
