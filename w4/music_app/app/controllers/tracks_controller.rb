class TracksController < ApplicationController

  before_action :logged_in?

  def new
  end

  def create
    track = Track.new(track_params)
    if track.save
      flash.now[:success] = "Track successfully added!"
      redirect_to track_url(track)
    else
      flash.now[:errors] = track.errors.full_messages
      render :new
    end
  end

  def update
    @track = Track.find(params[:id])

    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end


  def destroy
    @track = Track.find(params[:id])
    if @track.destroy
      flash[:success] = "Track deleted successfully!"
      redirect_to album_url(@track.album_id)
    else
      flash.now[:errors] = 'There was an error deleting the track, please try again.'
      render :show
    end
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  private

  def track_params
    params.require(:track).permit(:title, :album_id, :track_type, :lyrics)
  end
end
