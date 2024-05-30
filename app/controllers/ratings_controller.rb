class RatingsController < ApplicationController
  before_action :set_booking, only: %i[new create]

  def new
    @rating = Rating.new
    @offer = Offer.find(@booking.offer.id)
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.booking = @booking
    @rating.user = @booking.offer.user
    if @rating.save
      redirect_to bookings_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:score, :booking_id)
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end
end
