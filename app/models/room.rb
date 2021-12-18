class Room < ApplicationRecord
  has_many:room_member,dependent: :destroy
  has_many:chats,dependent: :destroy
end
