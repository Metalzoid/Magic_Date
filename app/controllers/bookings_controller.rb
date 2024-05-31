class BookingsController < ApplicationController
  before_action :set_offer, only: %i[new create]

  def index
    @bookings_client = Booking.where(user: current_user)
    @bookings_vendor = Booking.joins(:offer).where(offers: { user: current_user })
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.offer = @offer
    @booking.status = "En attente"
    if @booking.save
      redirect_to bookings_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  private

  def booking_params
    params.require(:booking).permit(:comment, :total_price, :user_id, :offer_id, :status, :start_date, :end_date)
  end

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end
end
