class TweetsController < ApplicationController
	def index
		@tweets = Tweet.all
	end

	def show
		@tweet = Tweet.find(params[:id])
		@tweet.body
	end
end
