class BandsController < ApplicationController

  before_action :logged_in?

  def new
  end

  def create
    band = Band.new(band_params)
    if band.save
      flash.now[:success] = "Band created!"
      redirect_to band_url(band)
    else
      flash.now[:errors] = []
      flash.now[:errors] << band.errors.full_messages
      render :new
    end
  end

  def update
    @band = Band.find(params[:id])

    if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def destroy
    @band = Band.find(params[:id])
    if @band.destroy
      flash[:success] = "Band deleted successfully!"
      redirect_to band_url
    else
      flash.now[:errors] = 'There was an error deleting the band, please try again.'
      render :show
    end
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
