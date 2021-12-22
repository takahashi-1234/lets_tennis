class Chat < ApplicationRecord
  belongs_to:customer
  belongs_to:room
  belongs_to:circle
  
  validates:message,presence:true,length:{maximum:100}
  
end