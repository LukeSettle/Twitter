class TweetsController < ApplicationController
	def index
		render json: Tweet.all
	end

	def show
		@tweet = Tweet.find(params[:id])
		render json: @tweet
	end

	def new
		@tweet = Tweet.new
	end

	def create
		@tweet = Tweet.new(tweet_params)
		if @tweet.save
			redirect_to tweets_path
		else
			render :new
		end
	end

	private

	def tweet_params
		params.require(:tweet).permit(:body)
	end
end