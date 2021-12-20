class Report < ApplicationRecord
  belongs_to:customer
  belongs_to:court
  validates:report_detail,length:{maximum:100}
end
