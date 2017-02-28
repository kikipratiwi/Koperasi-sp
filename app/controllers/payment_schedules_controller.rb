class PaymentScheduleController < ApplicationController
  before_action :authenticate_official!

  def payment
    @payment_schedule = 
    respond_to do |format|
      format.html { redirect_to member_loan_path(@member.id, @loan), notice: 'Loan was approved.' }
      format.json { head :no_content }
    end     
  end
end