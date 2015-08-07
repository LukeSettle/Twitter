class Tweet < ActiveRecord::Base
	belongs_to :user
	validates :body, length: {minimum: 5, maximum: 200}
  validates :user, presence: true
  default_scope { order('created_at DESC') }
end
