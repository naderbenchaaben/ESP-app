class Api::V3::OrderitemsController < ApplicationController
    before_action :set_order, only: %i[ show edit update destroy ]
    
    # GET /orders or /orders.json
    def index
      @orderItem = Order.all
      render json: @order
  
    end
  
    # GET /orders/1 or /orders/1.json
    def show
      @orderItem = Order.find(params[:id])
      render json: @orderItem
    end
  
    # GET /orders/new
    def new
      @orderItem = OrderItem.new
    end
  
    # GET /orders/1/edit
    def edit
    end
  
    # POST /orders or /orders.json
    def create
      @orderItem = OrderItem.create(orderItem_params)
      
  
          if @orderItem.save
         #  Product.change_stock(@orderItem.product_id, @orderItem.quantity)
            render json:@orderItem, status: :ok
          else
            #format.html { render :new, status: :unprocessable_entity }
            render json: {
               
            }
          
        end
    end
  
    # PATCH/PUT /orders/1 or /orders/1.json
    def update
      @orderItem = set_order
      if @orderItem.update(company_params)
        #format.html { redirect_to @category, notice: "Category was successfully updated." }
        render json:@orderItem, status: :ok
      else
        #format.html { render :edit, status: :unprocessable_entity }
        render json: {error: @orderItem.errors.messages }
    
    end
    end
  
    # DELETE /orders/1 or /orders/1.json
    def destroy
      @orderItem = set_order
         if @orderItem.destroy  
        head :no_content
         # format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
        else
          render json: {error: @orderItem.error.messege }
        end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_order
        @orderItem = OrderItem.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def orderItem_params
        params.require(:orderitem).permit(:order_id, :product_id, :quantity, :order_item_price)
      end
  end
  