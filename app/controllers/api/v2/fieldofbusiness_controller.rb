class Api::V2::FieldofbusinessController < ApplicationController

    def index
        fieldofbusiness = Fieldofbusiness.all
        render json:fieldofbusiness
      end

end