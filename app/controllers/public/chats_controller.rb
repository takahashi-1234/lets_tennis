class Public::ChatsController < ApplicationController
  before_action:authenticate_customer!
  before_action:set_circle
  before_action:set_room_members
  
  def show
    #room?memberが見つかればroomを変数に入れる
    unless @room_members.nil?
      @room=@room_members.room
    else
    #room_memberが見つからない場合新規にroomとroom_memberを作成する
      @room=Room.new
      @room.save
      RoomMember.create(customer_id:current_customer.id,circle_id:@circle.id,room_id:@room.id)
      RoomMember.create(customer_id:@circle.customer.id,circle_id:@circle.id,room_id:@room.id)
    end
    @chats=@room.chats
    @chats.where.not(customer_id:current_customer.id).update(checked:true)
    @chat=Chat.new(room_id:@room.id)
  end
  def create
    @room=@room_members.room
    @chat=current_customer.chats.new(chat_params)
    @chat.circle_id=@circle.id
    @chat.save
    @chats=@room.chats
    @chat=Chat.new(room_id:@room.id)
    render:show
  end
  
  private
  def chat_params
    params.require(:chat).permit(:message,:room_id)
  end
  
  def set_circle
    @circle=Circle.find(params[:circle_id])
  end
  
  def set_room_members
    @rooms=current_customer.room_members.pluck(:room_id)
    @room_members=RoomMember.find_by(circle_id:@circle.id,customer_id:@circle.customer.id,room_id:@rooms)
  end
end