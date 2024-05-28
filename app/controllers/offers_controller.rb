class OffersController < ApplicationController
  def index
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

def offer_params
  params.require(:offer).permit(:title, :description, :category, :price)
end
end
