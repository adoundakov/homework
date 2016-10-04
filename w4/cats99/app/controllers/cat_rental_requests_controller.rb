class CatRentalRequestsController < ApplicationController
  def new
    @cats = Cat.all
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(request_params)
    if @cat_rental_request.save
      redirect_to cats_url
    else
      flash.now[:errors] = @cat_rental_request.errors.full_messages
      render :new
    end
  end

  def approve
    @cat_rental_request = CatRentalRequest.find(params[:cat_rental_request_id])
    @cat_rental_request.approve!
    cat_id = @cat_rental_request.cat_id
    redirect_to "/cats/#{cat_id}"
  end

  def deny
    @cat_rental_request = CatRentalRequest.find(params[:cat_rental_request_id])
    @cat_rental_request.deny!
    redirect_to "/cats/#{@cat_rental_request.cat_id}"
  end

  private
  def request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end
