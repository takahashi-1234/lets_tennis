class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates:name,presence:true,length:{maximum:6}
         
  has_many:comments,dependent: :destroy
  has_many:favorites,dependent: :destroy
  has_many:reports,dependent: :destroy
  has_many:circles,dependent: :destroy
  has_many:courts,dependent: :destroy
  has_many:reviews,dependent: :destroy
  has_many:favorite_courts,through: :favorites,source: :court
  has_many:circle_favorites,dependent: :destroy
  
end