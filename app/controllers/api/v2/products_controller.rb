class Api::V2::ProductsController < ApplicationController
# before_action :set_product, only: %i[ create show edit update destroy ]
  def index 
    products = Product.all
    render json:products
  end
  def show_product
    products = Product.where("company_id = ?  ",params[:company_id]   )
    if products
      render json: {
        product: products
      }else
        render json: {
          product: error
        }
      
    end
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
    img = Cloudinary::Uploader.upload(params[:image])
    
    product = Product.create!(
    image: img["url"],
    product_name: params[:product_name],
    ref_product: params[:ref_product],
    price: params[:price],
    description: params[:description],
    available_quantity: params[:available_quantity],
    company_id: params[:company_id]
    
    )
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
    product =Product.find(params[:id])
    if product.update(
      product_params
    )
    render json:{
      status: :updated,
      product: product
    }
  end
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
      params.permit(:product_name, :ref_product, :price, :description,  :available_quantity, :image )
    end
end
