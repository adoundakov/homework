class SessionsController < ApplicationController

  before_action :already_logged_in?, except: [:destroy]

  def new
  end

  def create
    user = User.find_by_credentials(
        session_user_params[:username],
        session_user_params[:password]
        )
    if user
      login!(user)
      redirect_to cats_url
    else
      render :new
    end
  end

  def destroy
    logout!
    render :new
  end

  private

  def session_user_params
    params.require(:user).permit(:username, :password)
  end
end
