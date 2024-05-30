class BookingsController < ApplicationController

  
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @offer = Offer.find(params[:offer_id])
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.offer = @offer
    @booking.status = "Pending"
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:comment, :total_price, :user_id, :offer_id, :status, :start_date, :end_date)
  end

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end
end
