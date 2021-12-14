class Public::FavoritesController < ApplicationController
  before_action:authenticate_customer!

  def create
    if customer_signed_in?
      court=Court.find(params[:court_id])
      favorite=current_customer.favorites.new(court_id:court.id)
      favorite.save
      redirect_back(fallback_location:root_path)
    else
      redirect_to new_customer_session_path
    end
  end
  
  def destroy
    court=Court.find(params[:court_id])
    favorite=current_customer.favorites.find_by(court_id:court.id)
    favorite.destroy
    redirect_back(fallback_location:root_path)
  end
end
