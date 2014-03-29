class PostController < ApplicationController
	def index
		@posts = Post.order("id desc")
	end
end
