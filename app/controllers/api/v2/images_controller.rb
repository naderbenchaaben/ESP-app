class Api::V2::ImagesController < ApplicationController
 # before_action :set_image, only: %i[ show edit update destroy ]

  # GET /images or /images.json
  def index
    @images = Image.all
    render json: @images

  end

  # GET /images/1 or /images/1.json
  def show
    @image = set_image
    render json: @image
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images or /images.json
  def create
    @image = Image.new(image_params)

    respond_to :json

      if @image.save
        #format.html { redirect_to @image, notice: "Image was successfully created." }
       render json:@image, status: :ok
      else
        #format.html { render :new, status: :unprocessable_entity }
        ender json: {error: @images.errors.messages }
      
    end
  end

  # PATCH/PUT /images/1 or /images/1.json
  def update
    @catagory = set_image
      if @image.update(image_params)
        #format.html { redirect_to @image, notice: "Image was successfully updated." }
        render json:@image, status: :ok
      else
        #format.html { render :edit, status: :unprocessable_entity }
        render json:  { error: @images.errors.messages }
      
    end
  end

  # DELETE /images/1 or /images/1.json
  def destroy
    @image = set_image
    if @image.destroy
     head :no_content
      
    
    else
      render json: {error: @images.error.messege }

     # format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.require(:image).permit(:path)
    end
end
