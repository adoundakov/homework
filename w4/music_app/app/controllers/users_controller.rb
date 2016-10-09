class UsersController < ApplicationController

  before_action :logged_in?, :authorized?, only: [:show, :search]
  before_action :already_logged_in?, only: [:create, :new]
  before_action :is_admin?, only: [:index, :promote]

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "Account created! Just activate it to enjoy the music!"
      msg = UserMailer.activation_email(user)
      msg.deliver
      redirect_to new_session_url
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  def index
    render :index
  end

  def show
  end

  def promote
    user = User.find(params[:id])

    user.promote!
    flash[:success] = 'User promoted to admin!'
    redirect_to users_url
  end

  def activate
    user = User.find_by_activation_token(params[:activation_token])

    return nil unless user
    if params[:activation_token] == user.activation_token
      user.activate!
      flash[:success] = 'Your account is now activated. Please log in below.'
      redirect_to new_session_url
    else
      flash[:errors] = ['There was an error activating your account, please use the link from your email']
      redirect_to new_session_url
    end
  end

  def search
    query = parse_search

    # TODO: make each case search methods, or one general search method.
    # parse_search works, just need to implement model level search
    case search_params[:model]
    when 'Band'
      @results = Band.find_by()
    when 'Album'
    when 'Track'
    when 'Note'
    else
      flash[:errors] = ['Something went wrong, please try again']
      redirect_to user_url(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def search_params
    params.require(:search).permit(:model, :input)
  end

  def parse_search(search_params)
    query = {}

    parts = search_params[:input].split(' ')
    parts.map! { |part| part.split(':') }

    parts.each_with_index do |part|
      key, val = part
      if key.include?('id')
        query[key.to_sym] = val.to_i
      else
        query[key.to_sym] = val
      end
    end

    searchify(query)
  end
end
