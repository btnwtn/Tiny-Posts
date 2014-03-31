class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	# look in to cookie jar for user_id cookie
  	if cookies[:user_id]
  		# dip in to the signed cookie jar for our user_id value
  		user_id = cookies.signed[:user_id]
  		# find and return the user for that id 
  		User.find_by_id(user_id)
  	end
  end

  def sign_in user
  	# encrypt the value of our cookie
    cookies.signed[:user_id] =  user.id
  end

  def signed_in?
  	current_user # nil or #<User>
  end

  def authenticate
  	if !signed_in?
  		redirect_to new_session_path
  	end
  end

  # make current_user and signed_in? methods available inside of views
  helper_method :current_user, :signed_in?
end
