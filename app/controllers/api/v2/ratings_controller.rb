class Api::V2::RatingsController < ApplicationController

   before_action :set_rating, only: %i[create show edit update destroy ]
  
    # GET /orders or /orders.json
    def index
      @ratings = Rating.all
      render json: @ratings
  
    end
  
    # GET /orders/1 or /orders/1.json
    def show
      @rating = Rating.find(params[:id])
      render json: @rating
    end
  
    # GET /orders/new
    def new
      @rating = Rating.new
    end
  
    # GET /orders/1/edit
    def edit
    end
  
    # POST /orders or /orders.json
    respond_to :json

    def create
      @rating = Rating.new(rating_params)
      respond_to :json
      
        if @rating.save
          #format.html { redirect_to @order, notice: "Order was successfully created." }
         # render json: {  :show, status: :created, location: @rating}
         render json:@rating
        else
          #format.html { render :new, status: :unprocessable_entity }
          #format.json { render json: @rating.errors, status: :unprocessable_entity }
          render json: {error: @ratings.errors.messages }
        
      end
    end
  
    # PATCH/PUT /orders/1 or /orders/1.json
    def update
      @rating = set_rating
      if @rating.update(company_params)
        #format.html { redirect_to @category, notice: "Category was successfully updated." }
        render json:@rating, status: :ok
      else
        #format.html { render :edit, status: :unprocessable_entity }
        render json: {error: @ratings.errors.messages }
    
    end
      
    end
  
    # DELETE /orders/1 or /orders/1.json
    def destroy
      @rating = set_rating
       if @rating.destroy  
      head :no_content
       # format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      else
        render json: {error: @ratings.error.messege }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_rating
        @rating = Rating.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def rating_params
        params.require(:rating).permit(:socre)
      end
  end
  