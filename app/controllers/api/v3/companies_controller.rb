class Api::V3::CompaniesController < ApplicationController
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
            def showfob
                @company =Company.find_by(fieldofbusiness: params[:fieldofbusiness])
                render json:
                   @company
              
               end
    def getcompany
    @company =Company.find(params[:id])
    render json:
        @company
  end
     
       # GET /categories/new
       def new
       end
     
       # GET /categories/1/edit
       def edit
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
     