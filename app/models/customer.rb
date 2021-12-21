class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates:name,presence:true,length:{maximum:20}
  

  has_many:comments,dependent: :destroy
  has_many:favorites,dependent: :destroy
  has_many:reports,dependent: :destroy
  has_many:circles,dependent: :destroy
  has_many:courts,dependent: :destroy
  has_many:reviews,dependent: :destroy
  has_many:favorite_courts,through: :favorites,source: :court
  has_many:circle_favorites,dependent: :destroy
  has_many:room_members,dependent: :destroy
  has_many:chats,dependent: :destroy
  
  #is_quitedがfalseの場合trueを返す
  def active_for_authentication?
    super && (is_quited == false)
  end
  
  def unchecked_chats?
    my_rooms_ids = UserRoom.select(:room_id).where(customer_id: id)
    other_customer_ids = UserRoom.select(:customer_id).where(room_id: my_rooms_ids).where.not(customer_id: id)
    Chat.where(user_id: other_user_ids, room_id: my_rooms_ids).where.not(checked: true).any?
  end
  
end