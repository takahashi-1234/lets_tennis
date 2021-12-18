class Circle < ApplicationRecord
  has_many:events,dependent: :destroy
  belongs_to:customer
  belongs_to:court
  has_many:reviews,dependent: :destroy
  has_many:circle_favorites,dependent: :destroy
  has_many:room_members,dependent: :destroy
  has_many:chats,dependent: :destroy
  
  def favorited_by?(customer)
    circle_favorites.where(customer_id:customer.id).exists?
  end
end
