class Tweet < ActiveRecord::Base
	belongs_to :user
	validates :body, length: {minimum: 5, maximum: 200}
end
