class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
    # @post = Post.new(params["post"])
    @post = Post.new(post_params_permitted(:title, :description))
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
    # @post.update(params["post"])
    # @post.update(params.require(:post).permit(:title))
    @post.update(post_params_permitted(:title))
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
  end
  
  private

  def post_params_permitted(*args)
    params.require(:post).permit(*args)
  end
end
