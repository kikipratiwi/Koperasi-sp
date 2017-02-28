class Loan < ApplicationRecord
  enum status: [:waiting, :on_going, :paid_in_full], _suffix: true

  belongs_to :member
  belongs_to :loan_type
  has_one :payment

  def set_payment!
	 payment = self.build_payment
	 payment.total = 0
	 amount  = self.amount
	 term	 = self.loan_type.term.to_f
	 interest = Interest.flat_rate
	 
	 term.to_i.times do |inc|
	 	payment_schedule = payment.payment_schedules.new
	 	payment_schedule.amount = amount / term
	 	payment_schedule.interest = ((amount * ((interest * term)/100)) / term).to_f
	 	payment_schedule.sequence = inc + 1

	 	payment.total += payment_schedule.amount + payment_schedule.interest
	 end

	 payment.save
  end 
end
