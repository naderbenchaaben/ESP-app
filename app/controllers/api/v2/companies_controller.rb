class Api::V2::CompaniesController < ApplicationController
 # before_action :set_category, only: %i[ show edit update destroy ]
  
    # GET /campany or /categories.json
    def index
      @campanies = Company.all
      render json: @campanies
    end
  
    # GET /categories/1 or /categories/1.json
    def show
      @company =Company.find_by(user_id: params[:user_id])
      render json:
         @company
    
     end
  
    # GET /categories/new
    def new
    end
  
    # GET /categories/1/edit
    def edit
    end
  
    # POST /categories or /categories.json
    def create
      company = Company.create(company_params)
      if company
        render json:{
          status: :created,
          company: company
        }
      else
        render json: { status: 500 }
      end

      
      
    end
  
    # PATCH/PUT /categories/1 or /categories/1.json
    def uploadimage 
      img = Cloudinary::Uploader.upload(params[:image])
      company = Company.find(params[:id])
      if company.update(
       
        image: img["url"]
      )
      render json:{
        status: :updated,
        company: :company
      }
    else
      render json: {status: 550}
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
        params.require(:company).permit(:companyname, :city ,:user_id, :fieldofbusiness)
      end
  end
  