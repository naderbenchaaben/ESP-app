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
<<<<<<< HEAD
    
=======
>>>>>>> bc8c08c94c2131aabe9e2e636a2a398990f1110a
    def show
       user = User.find(params[:id])
       render json: user 
    end
    
end