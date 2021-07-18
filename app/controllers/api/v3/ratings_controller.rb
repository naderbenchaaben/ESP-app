class Api::V3::RatingsController < ApplicationController

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
    def create
    rating = Rating.create!(
        score: params[:score],
        user_id: params[:user_id],
        product_id: params[:product_id]
    )
    if rating 
        render json:{
        status: :created,
        rating: rating
    }
else
    render json: { status: 500}
end
    end

end