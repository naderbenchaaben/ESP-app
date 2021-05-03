
class Api::V1::UsersController < ApplicationController
def update
    user =User.find(params[:id])
    if user.update(
      lastname: params[:user][:lastname],
      firstname: params[:user][:firstname],
      companyname: params[:user][:companyname],
      telnum: params[:user][:telnum],
      fieldofbusiness: params[:user][:fieldofbusiness],
      city: params[:user][:city]
    )
    render json:{
        status: :updated,
        user: user
      }
    else
      render json: { status: 500 }
    end
end
end