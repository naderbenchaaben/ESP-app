class Api::V2::CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
    render json: @categories
  end

  # GET /categories/1 or /categories/1.json
  def show
    @category = set_category
    render json: @category
   end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    respond_to :json
      if @category.save
        #format.html { redirect_to @category, notice: "Category was successfully created." }
       render json:@category
      else
        #format.html { render :new, status: :unprocessable_entity }
        render json: {error: @categories.errors.messages }
      
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    
      if @category.update(category_params)
        #format.html { redirect_to @category, notice: "Category was successfully updated." }
        render json:@category, status: :ok
      else
        #format.html { render :edit, status: :unprocessable_entity }
        render json: {error: @categories.errors.messages }
     
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category = set_category
    if @category.destroy
     head :no_content 
    
    else
      render json: {error: @categories.error.messege }

     # format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:category_name)
    end
end
