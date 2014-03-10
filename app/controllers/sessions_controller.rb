class SessionsController < ApplicationController
  respond_to :html

  def new
  end

  def create
    user = authenticate_session(session_params)
    sign_in(user) do
      respond_with(user, location: root_path) and return
    end
    redirect_to magic_word_path
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end

