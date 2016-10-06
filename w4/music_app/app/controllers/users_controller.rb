class UsersController < ApplicationController

  before_action :logged_in?, :authorized?, only: [:show]
  before_action :already_logged_in?, only: [:create, :new]


  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      login!(user)
      flash.now[:success] = "Account created! Enjoy the music."
      redirect_to user_url(user)
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
