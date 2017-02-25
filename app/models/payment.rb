class Payment < ApplicationRecord
   belongs_to :loan
   has_many :payment_schedules
end
