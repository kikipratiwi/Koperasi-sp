class PaymentSchedule < ApplicationRecord
  enum status: [:not_yet_paid, :paid], _suffix: true

  belongs_to :payment
end
