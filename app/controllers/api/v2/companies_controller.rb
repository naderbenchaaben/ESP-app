class Api::V2::CompaniesController < ApplicationController
   before_action :set_category, only: %i[ show edit update destroy ]
  
    # GET /campany or /categories.json
    def index
      @campanies = Company.all
      render json: @campanies
    end
  
    # GET /categories/1 or /categories/1.json
    def show
      @company = Company.find(params[:id])
      render json: @company
     end
  
    # GET /categories/new
    def new
      @company = Company.new
    end
  
    # GET /categories/1/edit
    def edit
    end
  
    # POST /categories or /categories.json
    def create
      @company = Company.new(company_params)
  respond_to :json

      
        if @company.save
          #format.html { redirect_to @category, notice: "Category was successfully created." }
          render json:@company, status: :ok
        else
          #format.html { render :new, status: :unprocessable_entity }
          render json: {error: @companies.errors.messages }
        
      end
    end
  
    # PATCH/PUT /categories/1 or /categories/1.json
    def update
     @company = set_company
        if @company.update(company_params)
          #format.html { redirect_to @category, notice: "Category was successfully updated." }
          render json:@company, status: :ok
        else
          #format.html { render :edit, status: :unprocessable_entity }
          render json: {error: @companies.errors.messages }
      
      end
    end
  
    # DELETE /categories/1 or /categories/1.json
    def destroy
      @company = set_company
       if @company.destroy  
      head :no_content
       # format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      else
        render json: {error: @companies.error.messege }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_company
        @company = Company.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def company_params
        params.require(:company).permit(:companyname, :city)
      end
  end
  