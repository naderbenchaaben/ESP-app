class Api::V3::OrdersController < ApplicationController
    before_action :set_order, only: %i[ show edit update destroy ]
  
    # GET /orders or /orders.json
    def index
      @orders = Order.all
      render json: @order
  
    end
  
    # GET /orders/1 or /orders/1.json
    def show
      @order = Order.find(params[:id])
      render json: @order
    end
  
    # GET /orders/new
    def new
      @order = Order.new
    end
  
    # GET /orders/1/edit
    def edit
    end
  
    # POST /orders or /orders.json
    def create
      @order = set_order
    respond_to :json
  
        
          if @order.save
            #format.html { redirect_to @category, notice: "Category was successfully created." }
            render json:@order, status: :ok
          else
            #format.html { render :new, status: :unprocessable_entity }
            render json: {error: @orders.errors.messages }
          
        end
    end
  
    # PATCH/PUT /orders/1 or /orders/1.json
    def update
      @order = set_order
      if @order.update(company_params)
        #format.html { redirect_to @category, notice: "Category was successfully updated." }
        render json:@order, status: :ok
      else
        #format.html { render :edit, status: :unprocessable_entity }
        render json: {error: @orders.errors.messages }
    
    end
    end
  
    # DELETE /orders/1 or /orders/1.json
    def destroy
      @order = set_order
         if @company.destroy  
        head :no_content
         # format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
        else
          render json: {error: @orders.error.messege }
        end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_order
        @order = Order.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def order_params
        params.require(:order).permit(:order_type, :total_price, :company_id, :stage ,:order_shipping_address ,:order_pick_up_date, :order_pick_up_time, :user_id)
      end
  end
  