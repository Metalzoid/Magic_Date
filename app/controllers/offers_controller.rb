class OffersController < ApplicationController
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
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to root_path, status: :see_other, notice: "L'offre a été supprimée avec succès."
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :category, :price, :user_id)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
