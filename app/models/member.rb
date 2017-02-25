class Member < ApplicationRecord
  enum status: [:archived, :active, :inactive], _suffix: true
  enum gender: [:male, :female], _suffix: true

  belongs_to :official
  has_many :deposits
  has_many :loans
end

# member.active_status!
# member.archived_status? # => false