class Api::V2::ProductsController < ApplicationController
# before_action :set_product, only: %i[ create show edit update destroy ]

  

  # POST /products or /products.json
  def create
    product = Product.create!(
      #email: params[:user][:email],
      product_name: params[:product][:product_name],
      ref_product: params[:product][:ref_product],
      price: params[:product][:price],
      shortDesc: params[:product] [:shortDesc],
      description: params[:product][:description],
      available_quantity: params[:product][:available_quantity]
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
    product =Product.update!(
      product_name: params[:product][:product_name],
      ref_product: params[:product][:ref_product],
      price: params[:product][:price],
      shortDesc: params[:product] [:shortDesc],
      description: params[:product][:description],
      available_quantity: params[:product][:available_quantity]
    )
   end
    private
      def set_product
      product = Product.find(params[:id])
    end
end
