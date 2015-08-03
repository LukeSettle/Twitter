class TweetsController < ApplicationController
	def index
		render json: Tweet.all
	end

	def show
		@tweet = Tweet.find(params[:id])
		render json: @tweet.body
	end

	def new	
		@tweet = Tweet.new
	end

	def create
		@tweet = Tweet.new(tweet_params)
		if @tweet.save
			render json: @tweet
		else
			head :bad_request
		end
	end

	private

	def tweet_params
		params.require(:tweet).permit(:body)
	end
end