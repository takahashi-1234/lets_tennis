class Public::CommentsController < ApplicationController
  def create
    court=Court.find(params[:court_id])
    comment=current_customer.comments.new(comment_params)
    comment.court_id=court.id
    comment.save
    redirect_back(fallback_location:root_path)
  end
  def destroy
    Comment.find(params[:id]).destroy
    redirect_back(fallback_location:root_path)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment,:evaluation)
  end
end
