class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:sessions][:email])
		if user && user.authenticate(params[:sessions][:password])
			sign_in(user)
			redirect_to posts_path
		else
			# invalid log in credentials
			flash.now[:error] = "Unable to log in with the supplied credentials."
			render :new
		end
	end

	def destroy
		cookies.delete(:user_id)
		redirect_to root_path
	end
end