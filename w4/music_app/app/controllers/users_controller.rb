class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      login!(user)
      flash.now[:success] = "Account created! Enjoy the music."
      redirect_to users_url(user)
    else
      flash.now[:errors] = []
      flash.now[:errors] << user.errors.full_messages
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
