class FavouritesController < ApplicationController
  def create
    @favourite = Favourite.new
    @favourite.user = current_user
    @favourite.offer_id = params[:offer_id]
    if @favourite.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    Favourite.find_by(offer_id: params[:format], user: current_user).destroy
    redirect_to root_path
  end
end
