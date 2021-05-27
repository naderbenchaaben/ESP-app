class Api::V3::ProductsController < ApplicationController
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
      def show_products
        product = Product.where("company_id = ?  ",params[:company_id]   )
        if product
            render json: {
                product_list: product
               
            }else
                render json: {
                   product_list: error
                
            }
        end
        end   
      end
        private
          def set_product
          product = Product.find(params[:id])
        end
       
 
    