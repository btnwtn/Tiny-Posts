class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_create_parameters)

		if @user.save
			sign_in(@user)
			redirect_to posts_path
		else
			render :new
		end
	end

	def show
		@user = User.find_by_id(params[:id])

		if @user.nil?
			redirect_to root_path
		end
	end

	def edit
		@user = User.find_by_id(params[:id])

		if current_user != @user
			redirect_to root_path
		end
	end

	def update
		@user = current_user
		@user.update(user_update_parameters)

		if @user.save
			redirect_to user_profile_path
		else
			render :edit
		end
	end

	private
		# only allow content and author data to be submitted.
		def user_create_parameters
			params.require(:user).permit(:email, :username, :password, :password_confirmation)
		end

		def user_update_parameters
			params.require(:user).permit(:username)
		end
end
