class Public::CircleFavoritesController < ApplicationController
  before_action:authenticate_customer!
  before_action:set_circle
  
  def create
    @circle_favorite=current_customer.circle_favorites.new(circle_id:@circle.id)
    @circle_favorite.save
  end
  def destroy
    @circle_favorite=current_customer.circle_favorites.find_by(circle_id:@circle.id)
    @circle_favorite.destroy
  end
  
  private
  def set_circle
    @circle=Circle.find(params[:circle_id])
  end
end
