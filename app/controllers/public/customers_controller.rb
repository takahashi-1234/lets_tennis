class Public::CustomersController < ApplicationController
  before_action:authenticate_customer!
  before_action:search_customer!,only:[:show]
  
  def favorite_courts
    @q=current_customer.favorite_courts.ransack(params[:q])
    @courts=@q.result(distinct:true).page(params[:page])
    gon.favorite_courts=current_customer.favorite_courts
  end
  
  def show
    rooms=current_customer.room_members.pluck(:room_id)
    @rooms=Room.where(id: rooms)
    #roomにチャットがあればチャット相手を表示
    @room_chat=Chat.where(room_id: rooms)
  end
  
  def withdraw
    @customer=Customer.find(params[:customer_id])
    @customer.update(is_quited: true)
    reset_session
    flash[:notice]="退会手続きをしました。"
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
  
  #ユーザー以外は見れないように設定
  def search_customer!
    @customer=Customer.find(params[:id])
    return if @customer==current_customer
    flash[:notice] = 'アクセスする権限がありません'
    redirect_to root_path
  end
end
