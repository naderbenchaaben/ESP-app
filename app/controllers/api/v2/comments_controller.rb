class Api::V2::CommentsController < ApplicationController

    def show_comments
        comment = Comment.where("product_id = ?  ",params[:product_id]   )
        if comment 
            render json: {
                comment_list: comment
               
            }else
                render json: {
                    comment_list: "no comments"

                
            }
        end
        end
end