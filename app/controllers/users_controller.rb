class UsersController < ApplicationController
  respond_to :html
  before_filter :approve_user, only: [:create]

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)
    sign_in(@user) do
      respond_with(@user, location: root_path) and return
    end
    render :new
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def approve_user
    unless ApprovedUser.new(user_params).approved?
      redirect_to magic_word_path
    end
  end
end

