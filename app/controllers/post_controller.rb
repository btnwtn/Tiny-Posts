class PostController < ApplicationController
	# GET /posts
	def index
		@posts = Post.order("id desc")
	end

	# GET /post/new
	def new
		@post = Post.new
	end

	# POST /post
	def create
		@post = Post.new(post_parameters)

		if @post.save
			redirect_to post_index_path
		else
			render :new
		end
	end

	private
		# only allow content and author data to be submitted.
		def post_parameters
			params.require(:post).permit(:content, :author)
		end
end
