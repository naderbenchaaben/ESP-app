class Api::V3::ProductsController < ApplicationController
    # before_action :set_product, only: %i[ create show edit update destroy ]
      def index 
        products = Product.all
        render json:products
      end
      
      def getprod 
        product = Product.find(params[:id])
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

        def countproducts
        product = Product.where("company_id= ?", params[:company_id])
          nbproduct = product.count
          if nbproduct
          render json:{
            nbproduct: nbproduct
          }else{
            nbproduct: error
          }
          end
        end  
      end
        private
          def set_product
          product = Product.find(params[:id])
        end
       
 
    