class Api::V3::CommentsController < ApplicationController

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
        def create
            comment = Comment.create!(
                body: params[:body],
                user_id: params[:user_id],
                product_id: params[:product_id]
            )
            if comment 
                render json:{
                status: :created,
                comment: comment
            }
        else
            render json: { status: 500}
        end
            end
end