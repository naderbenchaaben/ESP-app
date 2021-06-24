class Api::V2::CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    categories = Category.all
    render json:categories
  end
  def show_category
    categories = Category.where("company_id = ?  ",params[:company_id]   )
    if categories
      render json: {
        categories: categories
      }else
        render json: {
          categories: error
        }
      
    end
  end

  # GET /categories/1 or /categories/1.json
  def show
  
   end

  # GET /categories/new
  def new
   
  end

  # GET /categories/1/edit
  

  # POST /categories or /categories.json
  def create
    category = Category.create(category_params)

   
      if category
        render json:{
        status: :created,
        category: category}
      else
        render json: { status: 500 }
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    category= Category.find(params[:id])
    category.update(category_params)
      
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    category = set_category
   if category.destroy
    head :no_content
   else
     render json: { status: 500 }
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:category_name, :company_id)
    end
end
