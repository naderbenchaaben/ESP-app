class RegistrationsController < Devise::RegistrationsController
   

 


  def create

    user = User.create!(
      email: params[:user][:email],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation],
      lastname: params[:user][:lastname],
      firstname: params[:user][:firstname],
      companyname: params[:user][:companyname],
      telnum: params[:user][:telnum],
      fieldofbusiness: params[:user][:fieldofbusiness],
      city: params[:user][:city],
      if_admin: params[:user][:if_admin],
      if_Topadmin: params[:user][:if_Topadmin],
      if_client: params[:user][:if_client]
    )

    if user
      render json:{
        status: :created,
        user: user
      }
    else
      render json: { status: 500 }
    end
  end

  
end