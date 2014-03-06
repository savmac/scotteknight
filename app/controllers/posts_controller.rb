class PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(get_params)
      redirect_to @post
    end
  end

  private

  def get_params
    params.require(:post).permit(:title, :body)
  end
end
