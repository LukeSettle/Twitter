class TweetsController < ApplicationController
	def index
		if current_user
			current_user.all_following.each do |f|
				render json: f.tweets
			end
		else
			render json: Tweet.all
		end
	end

	def show
		@tweet = Tweet.find(params[:id])
		render json: @tweet.body
	end

	def create
    authenticate_user!
		@tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
		if @tweet.save
			render json: @tweet
		else
      render json: {errors: @tweet.errors}, status: :unprocessable_entity
		end
	end

	private

	def tweet_params
		params.require(:tweet).permit(:body)
	end
end