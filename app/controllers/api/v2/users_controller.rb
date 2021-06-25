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
    def get_customer
      user = User.where("if_client = ? ", true )
      if user 
          render json: {
              client_list: user
             
           }else
              render json: {
                  client_list: error
              
          }
          end
      end
    def uploadimageuser 
        img = Cloudinary::Uploader.upload(params[:image])
        user = User.find(params[:id])
        if user.update(
         
          image: img["url"]
        )
        render json:{
          status: :updated,
          user: :user
        }
      else
        render json: {status: 550}
      end 
    end
    def show
       user = User.find(params[:id])
       render json: user 
    end
    
end