class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    @offer.save
    redirect_to offer_path(@offer)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :category, :price, :user_id)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
