class TweetsController < ApplicationController
	def index
		if current_user
			following_ids = current_user.all_following.map(&:id)
    	all_ids = following_ids << current_user.id
    	render json: Tweet.where(user_id: all_ids).order("created_at DESC")
    end
	end

	def show
		@tweet = Tweet.find(params[:id])
		render json: @tweet
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