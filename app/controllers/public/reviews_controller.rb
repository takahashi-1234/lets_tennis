class Public::ReviewsController < ApplicationController
  before_action:authenticate_customer!

  def create
    @circle=Circle.find(params[:circle_id])
    review=current_customer.reviews.new(review_params)
    review.circle_id=@circle.id
    review.save
    @review=Review.new
    @reviews=@circle.reviews.order(created_at: :desc)
    render:review_index
  end
  def destroy
    Review.find(params[:id]).destroy
    redirect_back(fallback_location:root_path)
  end
  
  private
  def review_params
    params.require(:review).permit(:comment,:evaluation)
  end
end
