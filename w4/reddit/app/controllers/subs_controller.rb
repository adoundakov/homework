class SubsController < ApplicationController

  before_action :is_moderator?, only: [:update, :destroy, :edit]

  def new
  end

  def create
    sub = Sub.new(title: sub_params[:title],
                  description: sub_params[:description],
                  moderator_id: current_user.id)
    if sub.save
      redirect_to sub_url(sub)
    else
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    sub = Sub.find(params[:id])
    if sub.update_attributes(sub_params)
      redirect_to sub_url(sub)
    else
      render :edit
    end
  end

  def index
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def destroy
    sub = Sub.find(params[:id])
    if sub.destroy
      redirect_to subs_url
    else
      redirect_to sub_url(sub)
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end

  def is_moderator?
    sub = Sub.find(params[:id])
    redirect_to subs_url unless current_user.id == sub.moderator_id
  end

end
