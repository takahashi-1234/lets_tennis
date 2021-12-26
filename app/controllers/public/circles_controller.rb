class Public::CirclesController < ApplicationController
  before_action:authenticate_customer!,except:[:index,:show]

  def new
    @circle=Circle.new
  end
  
  def create
    @circle=current_customer.circles.new(circle_params)
    if @circle.save
      flash[:notice]="サークルを登録しました。"
      redirect_to circle_path(@circle.id)
    else
      render:new
    end
  end
  
  def show
    @circle=Circle.find(params[:id])
    gon.court=@circle.court
    @reviews=@circle.reviews.order(created_at: :desc)
    @review=Review.new
    if customer_signed_in?
      @circle_favorite=current_customer.circle_favorites.find_by(circle_id:@circle.id)
    end
  end
  
  def index
    @q=Circle.ransack(params[:q])
    @circles=@q.result(distinct:true).page(params[:page]).order(created_at: :desc)
  end
  
  def edit
    @circle=Circle.find(params[:id])
  end
  private
  def circle_params
    params.require(:circle).permit(:level,:circle_name,:leader_name,:body,:member,:email,:court_id)
  end
end
