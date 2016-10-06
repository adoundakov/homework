class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(session_params[:email],
                                    session_params[:password])
    if user
      login!(user)
      redirect_to user_url(user)
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
