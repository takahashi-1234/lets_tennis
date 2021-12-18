class Review < ApplicationRecord
  belongs_to:circle
  belongs_to:customer
  
  validates:evaluation,numericality:{less_than_or_equal_to:5,greater_than_or_equal_to:1},presence:true
  validates:comment,presence:true,length:{maximum:100}
end
