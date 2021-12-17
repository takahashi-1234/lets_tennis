class Public::FavoritesController < ApplicationController
  before_action:authenticate_customer!
  before_action:set_court
  
  def create
    @favorite=current_customer.favorites.new(court_id: @court.id)
    @favorite.save
  end
  
  def destroy
    favorite=current_customer.favorites.find_by(court_id: @court.id)
    favorite.destroy
  end
  
  private
  def set_court
    @court=Court.find(params[:court_id])
  end
  
end
