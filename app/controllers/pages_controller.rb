class PagesController < ApplicationController
  def home
    @posts = Post.all
    render 'posts/index'
  end

  def about
  end
end
