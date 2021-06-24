class Api::V2::RatingsController < ApplicationController

def avgrating
    ratings = Rating.where("product_id= ?", params[:product_id])
    avgrating = ratings.average(:score)
    if avgrating
        render json:{
                rating: avgrating
            }else
    render json:{
        rating: 0
    }

    end
    end

end