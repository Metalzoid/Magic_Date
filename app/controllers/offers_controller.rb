class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def show
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

  def set_offer
    @offer = Offer.find(params[:id])
  end


  def offer_params
    params.require(:offer).permit(:title, :description, :price, :user_id,)
  end
end
