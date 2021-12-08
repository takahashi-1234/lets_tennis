class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many:comments,dependent: :destroy
  has_many:favorites,dependent: :destroy
  has_many:reports,dependent: :destroy
  has_many:circles,dependent: :destroy
  has_many:courts,dependent: :destroy
  
  has_many:favorite_courts,through: :favorites,source: :court
end
