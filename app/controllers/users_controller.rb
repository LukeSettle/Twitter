class UsersController < ApplicationController
	def index
    authenticate_user!
    users = User.all
    render_json_api users
  end

	def show
    authenticate_user!
    user = User.find(params[:id])
    raise UnauthorizedError unless current_user.id == user.id
    render_json_api user
  end

	def new
		@user = User.new
	end

	def create
    user = User.new(user_params)
    if user.save
      render_json_api user
    else
      render json: {errors: user.errors}, status: :unprocessable_entity
    end
  end

  def update
    authenticate_user!
    user = User.find(params[:id])
    raise UnauthorizedError unless current_user.id == user.id
    user.update(user_params)
    render_json_api user
  end

	def follow user
		@user = User.find(params[:id])
		@user.follow(user)
	end

	def following
		@user = User.find(params[:id])
		users_followed = @user.all_following
	end

	private

	def user_params
		params.require(:user).permit(:email, :password)
	end
end