class Api::V2::ProductsController < ApplicationController
 before_action :set_product, only: %i[ create show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
    render json: @product
  end

  # GET /products/1 or /products/1.json
  def show
    @product = set_product
    render json: @product
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    respond_to :json
    
      if @product.save
        #format.html { redirect_to @order, notice: "Order was successfully created." }
       # render json: {  :show, status: :created, location: @rating}
       render json:@product
      else
        #format.html { render :new, status: :unprocessable_entity }
        #format.json { render json: @rating.errors, status: :unprocessable_entity }
        render json: {error: @products.errors.messages }
      
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    @product = set_product
    if @product.update(company_params)
      #format.html { redirect_to @category, notice: "Category was successfully updated." }
      render json:@product, status: :ok
    else
      #format.html { render :edit, status: :unprocessable_entity }
      render json: {error: @products.errors.messages }
  
  end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product= set_product
       if @product.destroy  
      head :no_content
       # format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      else
        render json: {error: @products.error.messege }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:product_name, :ref_product, :price, :shortDes, :description, :available_quantity )
    end
end
