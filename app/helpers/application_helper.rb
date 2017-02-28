module ApplicationHelper
	def to_rp(number)
		number_to_currency(number, unit: "Rp.", separator: ",", delimiter: ".")
	end

	def to_datetime(date)
		date.in_time_zone.strftime("%d %b %Y %I:%M%p")
	end	

	def to_date(date)
		date.in_time_zone.strftime("%d %b %Y")
	end

	def member_id_format(date, id)
		date.strftime("%I%M-").to_s + id.to_s
	end	
end
