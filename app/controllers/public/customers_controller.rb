class Public::CustomersController < ApplicationController
  before_action:authenticate_customer!
  
  def favorite_courts
    @q=current_customer.favorite_courts.ransack(params[:q])
    @courts=@q.result(distinct:true).page(params[:page])
    gon.favorite_courts=current_customer.favorite_courts
  end
  
  def show
    @rooms=current_customer.room_members.pluck(:room_id)
    @room_members=RoomMember.where(room_id:@rooms)
    @chat_partners=@room_members.where.not(customer_id:current_customer.id)
  end
  
  def withdraw
    @customer=Customer.find(params[:customer_id])
    @customer.update(is_quited: true)
    reset_session
    redirect_to root_path
  end
  
  def edit
  end
  
  def update
    current_customer.update(customer_params)
    redirect_to customer_path(current_customer.id)
  end
  
  private
  def customer_params
    params.require(:customer).permit(:name,:age,:years_of_experience,:level,:email)
  end
end
