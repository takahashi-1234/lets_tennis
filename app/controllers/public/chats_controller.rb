class Public::ChatsController < ApplicationController
  before_action:authenticate_customer!
  before_action:set_circle
  
  def show
    rooms=current_customer.room_members.pluck(:room_id)
    room_members=RoomMember.find_by(circle_id:@circle.id,customer_id:@circle.customer.id,room_id:rooms)
    
    unless room_members.nil?
      @room=room_members.room
    else
      @room=Room.new
      @room.save
      RoomMember.create(customer_id:current_customer.id,circle_id:@circle.id,room_id:@room.id)
      RoomMember.create(customer_id:@circle.customer.id,circle_id:@circle.id,room_id:@room.id)
    end
    @chats=@room.chats
    @chat=Chat.new(room_id:@room.id)
  end
  def create
    @chat=current_customer.chats.new(chat_params)
    @chat.circle_id=@circle.id
    @chat.save
    redirect_back(fallback_location:root_path)
  end
  
  private
  def chat_params
    params.require(:chat).permit(:message,:room_id)
  end
  
  def set_circle
    @circle=Circle.find(params[:circle_id])
  end
end