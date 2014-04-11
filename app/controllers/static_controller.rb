class StaticController < ApplicationController
  def landing
  	if signed_in?
  		redirect_to posts_path
  	end
  end

end
