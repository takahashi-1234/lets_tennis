class Public::CommentsController < ApplicationController
  before_action:authenticate_customer!

  def create
    @court=Court.find(params[:court_id])
    @comment=current_customer.comments.new(comment_params)
    @comment.court_id=@court.id
    if @comment.save
      @comment=Comment.new
      @comments=@court.comments.order(created_at: :desc)
      render:comment_index
    else
      render:error
    end
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
