class RoomMember < ApplicationRecord
  belongs_to:customer
  belongs_to:room
  belongs_to:circle
  
  
  def uncheck_chats
    Chat.where(checked:false,room_id:room.id,customer_id:customer.id)
  end
end
