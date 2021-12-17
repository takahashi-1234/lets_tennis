class Public::CustomersController < ApplicationController
  before_action:authenticate_customer!
  
  def favorite_courts
    @q=current_customer.favorite_courts.ransack(params[:q])
    @courts=@q.result(distinct:true).page(params[:page])
    gon.favorite_courts=current_customer.favorite_courts
  end
  
  def show
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
