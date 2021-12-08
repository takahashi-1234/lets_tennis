class Circle < ApplicationRecord
  has_many:events,dependent: :destroy
  belongs_to:customer
  belongs_to:court
end
