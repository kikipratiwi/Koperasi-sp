module ApplicationHelper
	def to_rp(number)
		number_to_currency(number, unit: "Rp.", separator: ",", delimiter: ".")
	end
end
