class LoansController < ApplicationController
  before_action :authenticate_official!, :set_member, :member_active?, :set_type_collection, :set_interest
  before_action :set_loan, only: [:show, :edit, :update, :destroy]

  # GET /loans
  # GET /loans.json
  def index
    @loans = Loan.all
  end

  # GET /loans/1
  # GET /loans/1.json
  def show
  end

  # GET /loans/new
  def new
    @loan = set_member.loans.new
  end

  # GET /loans/1/edit
  def edit
  end

  # POST /loans
  # POST /loans.json
  def create
    @loan = set_member.loans.new(loan_params)

    respond_to do |format|
      if @loan.save
        @loan.set_payment!
        format.html { redirect_to @loan, notice: 'Loan was successfully created.' }
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
    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to member_loans_path(@member, @loan), notice: 'Loan was successfully updated.' }
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
      format.html { redirect_to loans_url, notice: 'Loan was successfully destroyed.' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def member_active?
      unless @member.active_status?
        redirect_to member_path(@member)
      end
    end

    def set_interest
      @interest = Interest.flat_rate
    end

    def set_type_collection
      @type_collection = LoanType.all.collect {|i| ["#{i.name.titleize} - #{i.term.to_s}", i.id]}
    end

    def set_loan
      @loan = Loan.find(params[:id])
    end

    def set_member
      @member = Member.find(params[:member_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_params
      params.fetch(:loan, {}).permit(:loan_type_id, :amount, :accorded_at, :loan_at, :paid_off_at, :info)
    end
end
