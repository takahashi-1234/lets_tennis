class Court < ApplicationRecord
  belongs_to:customer
  has_many:comments,dependent: :destroy
  has_many:favorites,dependent: :destroy
  has_many:reports,dependent: :destroy
  has_many:circles,dependent: :destroy
  
  def favorited_by?(customer)
    favorites.where(customer_id:customer.id).exists?
  end
end