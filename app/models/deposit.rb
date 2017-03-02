class Deposit < ApplicationRecord
  belongs_to :member
  belongs_to :deposit_category

  validates :amount, presence: true
end
