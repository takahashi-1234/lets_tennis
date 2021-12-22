class ApplicationController < ActionController::Base
  before_action:configure_permitted_parameters,if: :devise_controller?
  before_action:total_uncheck_chats,if: :customer_signed_in?
  
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name,:age,:years_of_experience,:level])
  end
  #サイドバーに表示する未読件数
  def total_uncheck_chats
    rooms=current_customer.room_members.pluck(:room_id)
    chat_partners=RoomMember.where(room_id:rooms).where.not(customer_id:current_customer.id)
    chat_partners_id=chat_partners.pluck(:customer_id)
    @total_uncheck_chats=Chat.where(checked:false,customer_id:chat_partners_id).count
  end

end
