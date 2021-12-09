class Public::CirclesController < ApplicationController
  def new
    @circle=Circle.new
  end
  
  def create
    circle=current_customer.circles.new(circle_params)
    circle.save
    redirect_to circle_path(circle.id)
  end
  
  def show
    @circle=Circle.find(params[:id])
    gon.court=@circle.court
    @reviews=@circle.reviews.order(created_at: :desc)
    @review=Review.new
  end
  
  def index
    @circles=Circle.all
  end
  
  def edit
    @circle=Circle.find(params[:id])
  end
  private
  def circle_params
    params.require(:circle).permit(:level,:circle_name,:leader_name,:body,:member,:email,:court_id)
  end
end
