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
	  @post = Post.new(param_create)
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(param_update)
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
  end
  
  private
  def param_create
    params.require(:post).permit(:title, :description)
  end

  def param_update
    params.require(:post).permit(:title)
  end
end
