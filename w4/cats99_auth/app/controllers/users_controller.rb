class UsersController < ApplicationController

  before_action :already_logged_in?, execpt: :destroy

  def create
    #Learning opportunity
    user = User.new(user_params)
    if user.save
      login!(user)
      UserMailer.welcome_email(user).deliver
      redirect_to cats_url
    else
      render :new
    end
  end

  def new
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
