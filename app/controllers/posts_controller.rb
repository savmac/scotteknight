class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(get_params)
    if @post.save
      redirect_to @post
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def get_params
    params.require(:post).permit(:title, :body)
  end
end
