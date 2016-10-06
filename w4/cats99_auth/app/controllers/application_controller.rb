class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logout!
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
    end
  end

  def login!(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def require_login
    unless current_user
      flash[:errors] = "You must be logged in to access this section"
      redirect_to '/'
    end
  end

  def already_logged_in?
    if current_user
      flash[:errors] = "You're already logged in, you dingus!"
      redirect_to cats_url
    end
  end

  def check_ownership
    cat = Cat.find(params[:id])
    redirect_to cats_url unless cat.owner == current_user
  end
end
