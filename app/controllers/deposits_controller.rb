class DepositsController < ApplicationController
  before_action :authenticate_official!, :set_member, :member_active?, :set_category_collection, :set_compulsory_saving_amount
  before_action :set_deposit, only: [:show, :edit, :update, :destroy]

  # GET /deposits
  # GET /deposits.json
  def index
    @deposits = Deposit.all
  end

  # GET /deposits/1
  # GET /deposits/1.json
  def show
  end

  # GET /deposits/new
  def new
    @deposit = set_member.deposits.new
  end

  # GET /deposits/1/edit
  def edit
  end

  # POST /deposits
  # POST /deposits.json
  def create
    @deposit = set_member.deposits.new(deposit_params)

    respond_to do |format|
      if @deposit.save
        format.html { redirect_to member_deposit_path(@member, @deposit), notice: 'Deposit was successfully created.' }
        format.json { render :show, status: :created, location: @deposit }
      else
        format.html { render :new }
        format.json { render json: @deposit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deposits/1
  # PATCH/PUT /deposits/1.json
  def update
    respond_to do |format|
      if @deposit.update(deposit_params)
        format.html { redirect_to redirect_to member_deposit_path(@member, @deposit), notice: 'Deposit was successfully updated.' }
        format.json { render :show, status: :ok, location: @deposit }
      else
        format.html { render :edit }
        format.json { render json: @deposit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deposits/1
  # DELETE /deposits/1.json
  def destroy
    @deposit.destroy
    respond_to do |format|
      format.html { redirect_to redirect_to member_deposit_path(@member, @deposit), notice: 'Deposit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def member_active?
      unless @member.active_status?
        redirect_to member_path(@member)
      end
    end

    def set_compulsory_saving_amount
      @compulsory_saving_amount = Saving.compulsory_saving_amount
    end

    def set_category_collection
      @category_collection = DepositCategory.all.where.not(name: 'pokok').collect {|i| [i.name.titleize, i.id]}
    end

    def set_deposit
      @deposit = Member.find(params[:member_id]).deposits.find(params[:id])
    end

    def set_member
      @member = Member.find(params[:member_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deposit_params
      params.fetch(:deposit, {}).permit(:deposit_category_id, :amount, :info)
    end
end
