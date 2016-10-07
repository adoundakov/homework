class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(session_params[:email],
                                    session_params[:password])
    if user && user.activated
      login!(user)
      redirect_to user_url(user)
    elsif user.activated == false
      flash.now[:errors] = "Account not activated, please check your email."
      render :new
    else
      flash.now[:errors] = "Username or password not found."
      render :new
    end
  end

  def destroy
    logout!(current_user)
    flash.now[:success] = "Successfully logged out, see you soon!"
    render :new
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
