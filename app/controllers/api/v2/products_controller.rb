class Api::V2::ProductsController < ApplicationController
# before_action :set_product, only: %i[ create show edit update destroy ]
  def index 
    products = Product.all
    render json:products
  end
  
  def show 
    product = set_product
    if product 
      render json: {
        product: product
      }
    end
  end

  # POST /products or /products.json
  def create
    product = Product.create(product_params)
    if product
      render json:{
        status: :created,
        product: product
      }
    else
      render json: { status: 500 }
    end
  end
   def update
    product =Product.update(
      product_params
    )
   end
   def destroy
    product = set_product
    if product.destroy
     head :no_content 
    
    else
      render json: { status: 500 }

     # format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
    end
    
  end
    private
      def set_product
      product = Product.find(params[:id])
    end
    def product_params
      params.require(:product).permit(:product_name, :ref_product, :price, :description, :shortDesc, :available_quantity, images: [])
    end
end
