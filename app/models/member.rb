class Member < ApplicationRecord
  enum status: [:archived, :active, :inactive], _suffix: true
  enum gender: [:male, :female], _suffix: true


  validates :name, :address, :birthplace, :birthdate, :phone_number, :status, :gender, presence: true

  belongs_to :official
  has_many :deposits
  has_many :loans
end

# member.active_status!
# member.archived_status? # => false
# 	validate :not_allowed_blank

	# def not_allowed_blank
	#   if [self.name, self.address, self.birthplace, self.birthdate, self.phone_number, self.status, self.gender].reject(&:blank?).size == 0
	#     errors[:base] << ("Please choose at least one name - any language will do.")
	#   end
	# end