class MembersController < ApplicationController
  before_action :authenticate_official!
  before_action :set_member, only: [:pay_principal_savings, :show, :edit, :update, :destroy]
  before_action :set_principal_amount, only: [:pay_principal_savings, :show, :index]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = current_official.members.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def pay_principal_savings
    category = DepositCategory.find_by_name("pokok")
    @deposit = @member.deposits.new(deposit_category_id: category.id, amount: @amount)
    respond_to do |format|
      # binding.pry
      if @deposit.save
        @member.update_attribute(:status, 1)  
        format.html { redirect_to @member, notice: 'Simpanan Pokok berhasil disimpan successfully.' }
        format.json { render :show, status: :saved, location: @member }
      else
        format.html { redirect_to @member, notice: "invalid!" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end     
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_principal_amount
      @amount =  Saving.principal_saving_amount
    end
     
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.fetch(:member, {}).permit(:name, :address, :birthplace, :birthdate, :phone_number, :status, :gender, :info)
      # params.require(:member).permit(:name, :address, :birthplace, :birthdate, :phone_number, :status, :gender, :info)

    end
end
