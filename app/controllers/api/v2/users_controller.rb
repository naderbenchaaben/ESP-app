class Api::V2::UsersController < ApplicationController

    def show_costomer
    user = User.where("if_client = ? and city = ? ", true ,params[:city]   )
    if user 
        render json: {
            client_list: user
           
        }else
            render json: {
                client_list: error
            
        }
    end
    end
    end