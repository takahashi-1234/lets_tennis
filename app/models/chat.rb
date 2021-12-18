class Chat < ApplicationRecord
  belongs_to:customer
  belongs_to:room
  belongs_to:circle
end
