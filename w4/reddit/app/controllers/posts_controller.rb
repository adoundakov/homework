class PostsController < ApplicationController
  before_action :is_author?, only: [:update, :edit, :destroy]

  def create
    author_id = current_user.id
    post = Post.new(
      title: post_params[:title],
      content: post_params[:content],
      url: post_params[:url],
      author_id: author_id,
    )
    if post.save
      post.sub_ids = parse_sub_names
      redirect_to post_url(post)
    else
      @sub = Sub.find(sub_id: sub_id)
      render :new
    end

  end

  def update
    post = Post.find(params[:id])
    if post.nil?
      redirect_to subs_url
    elsif post.update_attributes(post_params)
      post.sub_ids = parse_sub_names
      redirect_to post_url(post)
    else
      # errors
      redirect_to post_url(post)
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.nil?
      redirect_to subs_url
    elsif post.destroy
      redirect_to post_url(post)
    else
      # errors
      redirect_to post_url(post)
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def new
    @sub = Sub.find(params[:sub_id])
    render :new
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :url, :sub_names)
  end

  def is_author?
    post = Post.find(params[:id])
    redirect_to post_url(post) unless current_user == post.author
  end

  def parse_sub_names
    sub_names = params[:post][:sub_names].first.split('\r\n')
    sub_ids = []
    subs = Sub.all.each do |sub|
      sub_ids << sub.id if sub_names.include?(sub.title)
    end
    sub_ids
  end
end
