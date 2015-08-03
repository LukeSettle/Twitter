class UsersController < ApplicationController
	def index
    if current_user
      render json: current_user.followers
    else
      render json: User.all
    end
  end

	def show
    user = User.find(params[:id])
    render json: user
  end

	def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: {errors: user.errors}, status: :unprocessable_entity
    end
  end

  def update
    authenticate_user!
    user = User.find(params[:id])
    raise UnauthorizedError unless current_user.id == user.id
    user.update(user_params)
    render json: user
  end

	def follow user
    authenticate_user!
		@user = User.find(params[:user_id])
		current_user.follow(@user)
    head :ok
	end

  def unfollow user
    authenticate_user!
    @user = User.find(params[:user_id])
    current_user.stop_following(@user)
    head :ok
  end

	private

	def user_params
		params.require(:user).permit(:email, :password)
	end
end
