class Api::V1::SessionsController < ApplicationController
    
    def create
        user = User.find_by(email: params["user"]["email"])#.try(:authenticate, params["password"])
       
        if user.valid_password?(params["user"]["password"])
            session[:user_id] = user.id 
            render json: {
                status: :created,
                logged_in:true,
                user: user
            }
        else
            render json: { status: 401 }
        end
    end
    def logged_in
            if user_signed_in? 
                render json: {
                    logged_in: true,
                    user: user_signed_in
                }
            else
                render json: {
                    logged_in: false
                }
            end
        end
    def logout
            reset_session
            render json: {status: 200, logged_out: true}
    end
        
    
end