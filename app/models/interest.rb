class Interest < ApplicationRecord
	scope :flat_rate, -> { self.find_by_type_name('Flat').rate	 }
end
	