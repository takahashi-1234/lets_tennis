class Event < ApplicationRecord
  belongs_to:circle
  
  validates:title,presence:true,length:{maximum:20}
  validates:body,presence:true,length:{maximum:100}
  validates:event_date,presence:true
  validates:event_deadline,presence:true
  #期日との差分を計算する。差分はRational型（分数）で返るので分子を取る
  def deadline
    (event_deadline-Date.today).numerator
  end
end
