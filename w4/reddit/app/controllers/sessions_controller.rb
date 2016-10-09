class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.nil?
      # error message
      render :new
    else
      login!(user)
      session[:session_token] = user.session_token
      redirect_to user_url(user)
    end
  end

  def destroy
    logout!
    render :new
  end
end
