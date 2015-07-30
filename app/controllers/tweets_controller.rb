class TweetsController < ApplicationController
	def index
		render json: Tweet.all
	end

	def show
		@tweet = Tweet.find(params[:id])
		render json: @tweet
	end
end
