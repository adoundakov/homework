class AlbumsController < ApplicationController

  before_action :logged_in?
  before_action :is_admin?, except: [:show]

  def new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash.now[:success] = "Album added successfully!"
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def update
    @album = Album.find(params[:id])

    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def destroy
    @album = Album.find(params[:id])
    if @album.destroy
      flash[:success] = "Album deleted successfully!"
      redirect_to band_url(@album.band_id)
    else
      flash.now[:errors] = 'There was an error deleting the album, please try again.'
      render :show
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def index
  end

  private

  def album_params
    params.require(:album).permit(:title, :band_id, :production_type, :genre)
  end
end
