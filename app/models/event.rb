class Event < ApplicationRecord
  belongs_to:circle
  
  #期日との差分を計算する。差分はRational型（分数）で返るので分子を取る
  def deadline
    (event_deadline-Date.today).numerator
  end
end
