class Saving < ApplicationRecord
	scope :principal_saving_amount, -> { self.find_by_saving('Pokok').amount }
	scope :compulsory_saving_amount, -> { self.find_by_saving('Wajib').amount }
end
