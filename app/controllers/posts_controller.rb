class PostsController < ApplicationController
	before_filter :authenticate

	# GET /post
	def index
		@posts = Posts.order("id desc")
	end

	# GET /post/new
	def new
		@post = Posts.new
	end

	# POST /post
	def create
		@post = Posts.new(posts_parameters)
		@post.user_id = current_user.id

		if @post.save
			redirect_to posts_path
		else
			render :new
		end
	end

	private
		# only allow content and author data to be submitted.
		def posts_parameters
			params.require(:posts).permit(:content)
		end
end
