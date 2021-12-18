class Court < ApplicationRecord
  belongs_to:customer
  has_many:comments,dependent: :destroy
  has_many:favorites,dependent: :destroy
  has_many:reports,dependent: :destroy
  has_many:circles,dependent: :destroy
  
  validates:name,presence:true,length:{maximum:20}
  
  def self.ransackable_attributes(auth_object=nil)
    %w[name address]
  end
  def self.ransackable_associations(auth_object=nil)
    []
  end
  
  def favorited_by?(customer)
    favorites.where(customer_id:customer.id).exists?
  end
end