class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_offer, only: %i[show edit destroy update]

  def index
    if params[:search]
      if params[:search][:query] == ""
        @offers = Offer.all
      else
        @offers = Offer.where(category: params[:search][:query])
      end
    else
      @offers = Offer.all
    end
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @offer.update(offer_params)
      redirect_to offer_path(@offer)
    else
      render :edit, status: :unprocessable_entity
    end
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
