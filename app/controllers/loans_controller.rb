class LoansController < ApplicationController
  before_action :authenticate_official!, :set_member, :member_active?, :set_type_collection, :set_interest
  before_action :set_loan, only: [:show, :edit, :update, :destroy, :approvment, :payment]

  # GET /loans
  # GET /loans.json
  def index
    @loans = @member.loans
  end

  # GET /loans/1
  # GET /loans/1.json
  def show
    # set_field_for_payment_schedule_table
    set_payment
    set_payment_schedules
  end

  # GET /loans/new
  def new
    @loan = set_member.loans.new
    @url = member_loans_path(params[:member_id])    
  end

  # GET /loans/1/edit
  def edit
    @loan = set_loan
    @url = member_loan_path(params[:member_id], @loan)        
  end

  # POST /loans
  # POST /loans.json
  def create
    @url = member_loans_path(params[:member_id])  
    @loan = set_member.loans.new(loan_params)

    respond_to do |format|
      if @loan.save
        @loan.set_payment!
        format.html { redirect_to member_loan_path(@member, @loan), notice: 'Loan was successfully created.' }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loans/1
  # PATCH/PUT /loans/1.json
  def update
    @url = member_loan_path(params[:member_id], @loan)
    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to member_loan_path(@member, @loan), notice: 'Loan was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1
  # DELETE /loans/1.json
  def destroy
    @loan.destroy
    respond_to do |format|
      format.html { redirect_to member_loans_path(@member), notice: 'Loan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def calculate_payment
    amount = params[:amount].to_f
    @term   = LoanType.find(params[:loan_type_id]).term.to_f
    set_interest 
    @principal        = (amount / @term).to_f.round(2)
    @interest_amount  = ((amount * ((@interest * @term)/100)) / @term).to_f
    @total            = (@principal + @interest_amount).to_f.round(2)
  end

  def approvment
    @loan.update_attributes(accorded_at: DateTime.now, status: 1)
    @loan.payment.update_attribute(:due_date, DateTime.now.day)
    @loan.payment.payment_schedules.each_with_index do |payment_schedule, inc|
      payment_schedule.update_attribute(:due_date, (DateTime.now + inc.month))
    end
    respond_to do |format|
      format.html { redirect_to member_loan_path(@member.id, @loan), notice: 'Loan was approved.' }
      format.json { head :no_content }
    end    
  end

  def payment
    # payment_schedule = @loan.payment.payment_schedules.find(params[:payment_schedule_id])
    # payment_schedule.update_attribute(:status, 1)
    payment_schedules = @loan.payment.payment_schedules.where(status: 0).limit(params[:total_month_to_pay])
  # binding.pry
    respond_to do |format|
      if payment_schedules.size != (params[:total_month_to_pay]).to_i
        format.html { redirect_to member_loan_path(@member, @loan), notice: 'Jumlah bulan tidak sesuai' }
      else

        payment_schedules.update_all(status: 1, updated_at: DateTime.now)
        @loan.update_attributes(paid_off_at: DateTime.now, status: 2) if @loan.payment.payment_schedules.last.paid_status?

        format.html { redirect_to member_loan_path(@member.id, @loan), notice: 'Loan was paid.' }
        format.json { head :no_content }
      end
    end 

    # if payment_schedules.size < params[:total_month_to_pay].to_i
    #   format.html { redirect_to member_loan_path(@member, @loan), notice: 'Jumlah bulan terlalu besar' }
    # else
    #   respond_to do |format|
    #     format.html { redirect_to member_loan_path(@member.id, @loan), notice: 'Loan was paid.' }
    #     format.json { head :no_content }
    #   end     
    # end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def member_active?
      unless @member.active_status?
        redirect_to member_path(@member)
      end
    end

    def set_field_for_payment_schedule_table
      amount = @loan.amount.to_f
      @term   = @loan.loan_type.term.to_f
      set_interest 
      @principal        = (amount / @term).to_f.round(2)
      @interest_amount  = ((amount * ((@interest * @term)/100)) / @term).to_f
      @total            = (@principal + @interest_amount).to_f.round(2)
    end

    def set_payment_schedules
      @payment_schedules = @payment.payment_schedules
    end

    def set_payment
      @payment = @loan.payment
    end

    def set_interest
      @interest = Interest.flat_rate
    end

    def set_type_collection
      @type_collection = LoanType.all.collect {|i| ["#{i.name.titleize} - #{i.term.to_s}", i.id]}
    end

    def set_loan
      @loan = set_member.loans.find(params[:id])
    end

    def set_member
      @member = Member.find(params[:member_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_params
      params.fetch(:loan, {}).permit(:loan_type_id, :amount, :accorded_at, :loan_at, :paid_off_at, :info)
    end
end
