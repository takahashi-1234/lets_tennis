class Admin::CustomerController < ApplicationController
  def index
    @q=Customer.ransack(params[:q])
    @customers=@q.result(distinct:true).page(params[:page]).order(created_at: :desc)
  end
  
  def update
    customer=Customer.find(params[:id])
    if customer.is_quited
      customer.is_quited=false
    else
      customer.is_quited=true
    end
    customer.save
    redirect_back(fallback_location:root_path)
  end
end
