class Member < ApplicationRecord
  enum status: [:archived, :active, :inactive], _suffix: true
end

# member.active_status!
# member.archived_status? # => false