class Loan < ApplicationRecord
  enum info: [:waiting, :on_going, :paid_in_full], _suffix: true

  belongs_to :member
  belongs_to :loan_type
  has_one :payment
end
