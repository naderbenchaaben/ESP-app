class Api::V3::CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    categories = Category.all
    render json:categories
  end

  # GET /categories/1 or /categories/1.json
 
  # GET /categories/new
  def new
   
  end

  def show_categories
    category = Category.where("company_id = ?  ",params[:company_id]   )
    if category
        render json: {
            categories_list: category
           
        }else
            render json: {
              categories_list: error
            
        }
    end
    end
  

  # POST /categories or /categories.json


  # PATCH/PUT /categories/1 or /categories/1.json
  

  # DELETE /categories/1 or /categories/1.json
 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:category_name)
    end
end
