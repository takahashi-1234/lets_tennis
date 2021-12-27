class Public::CourtsController < ApplicationController
  before_action:authenticate_customer!,except:[:index,:show]
  
  def index
    @q=Court.ransack(params[:q])
    @courts=@q.result(distinct:true).page(params[:page]).order(created_at: :desc)
    gon.courts=Court.all
  end
  def show
    @court=Court.find(params[:id])
    gon.court=Court.find(params[:id])
    @comment=Comment.new
    @comments=@court.comments.order(created_at: :desc)
    @circles=Circle.where(court_id:@court.id)
    @report=Report.new
    if customer_signed_in?
      @favorite=current_customer.favorites.find_by(court_id: @court.id)
    end
  end
  def new
    @court=Court.new
  end
  def create
    @court=Court.new(court_params)
    results=Geocoder.search([@court.latitude,@court.longitude])
    @court.address=results.first.address[12..100]
    @court.customer_id=current_customer.id
    if @court.save
      flash[:notice]="コートを登録しました。"
      redirect_to root_path
    else
      render :new
    end
  end
  
  private
  def court_params
    params.require(:court).permit(:name,:latitude,:longitude,:operation,:court_kind,:price)
  end
end
