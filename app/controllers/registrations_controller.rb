class RegistrationsController < Devise::RegistrationsController
   
 # respond_to :json
  def create
    byebug
      @user = User.new(sign_up_params)
      if @user.save
#render json: @user
        respond_to do |format|
 # format.html { redirect_to(@form, notice: "Form created successfully") }
            format.json { render json: {message: "Form created successfully"} }
        end
          else
        #render json: { errors: @user.errors }
        respond_to do |format|
         # format.html { render 'new' }
          format.json { render json: {errors: @user.errors}}
        end
    end
  end
  private
  def sign_up_params
      params.permit(:email, :password, :password_confirmation, :firstname, :lastname, :companyname, :fieldofbusiness, :city )
    end
  end