class DepositCategory < ApplicationRecord
	enum name: [:wajib, :pokok, :sukarela], _suffix: true
	has_many :deposits
end
