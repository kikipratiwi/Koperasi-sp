class DepositCategoriesController < ApplicationController
  before_action :set_deposit_category, only: [:show, :edit, :update, :destroy]

  # GET /deposit_categories
  # GET /deposit_categories.json
  def index
    @deposit_categories = DepositCategory.all
  end

  # GET /deposit_categories/1
  # GET /deposit_categories/1.json
  def show
  end

  # GET /deposit_categories/new
  def new
    @deposit_category = DepositCategory.new
  end

  # GET /deposit_categories/1/edit
  def edit
  end

  # POST /deposit_categories
  # POST /deposit_categories.json
  def create
    @deposit_category = DepositCategory.new(deposit_category_params)

    respond_to do |format|
      if @deposit_category.save
        format.html { redirect_to @deposit_category, notice: 'Deposit category was successfully created.' }
        format.json { render :show, status: :created, location: @deposit_category }
      else
        format.html { render :new }
        format.json { render json: @deposit_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deposit_categories/1
  # PATCH/PUT /deposit_categories/1.json
  def update
    respond_to do |format|
      if @deposit_category.update(deposit_category_params)
        format.html { redirect_to @deposit_category, notice: 'Deposit category was successfully updated.' }
        format.json { render :show, status: :ok, location: @deposit_category }
      else
        format.html { render :edit }
        format.json { render json: @deposit_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deposit_categories/1
  # DELETE /deposit_categories/1.json
  def destroy
    @deposit_category.destroy
    respond_to do |format|
      format.html { redirect_to deposit_categories_url, notice: 'Deposit category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deposit_category
      @deposit_category = DepositCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deposit_category_params
      params.fetch(:deposit_category, {}).permit(:name)
    end
end
