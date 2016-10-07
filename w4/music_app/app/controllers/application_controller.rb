class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :is_admin?

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login!(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def logout!(user)
    current_user.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end

  def logged_in?
    unless current_user
      flash[:errors] = "You must be logged in to access this section"
      redirect_to '/'
    end
  end

  def already_logged_in?
    if current_user
      flash[:errors] = "Already logged in!"
      redirect_to '/'
    end
  end

  def authorized?
    unless current_user.admin
      if logged_in? && current_user.id == params[:id]
        flash[:errors] = "Unauthorized Action"
        redirect_to '/'
      end
    end
  end

  def is_admin?
    unless current_user.admin
      fail
      flash[:errors] = "Need to be an admin to see this page"
      redirect_to bands_url
    end
  end
end
