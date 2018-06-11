class HouseImagesController < ApplicationController
  before_action :set_house_image, only: [:show, :update, :destroy]

  # GET /house_images
  def index
    @house_images = HouseImage.all

    render json: @house_images
  end

  # GET /house_images/1
  def show
    render json: @house_image
  end

  # POST /house_images
  def create
    @house_image = HouseImage.new(house_image_params)

    if @house_image.save
      render json: @house_image, status: :created, location: @house_image
    else
      render json: @house_image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /house_images/1
  def update
    if @house_image.update(house_image_params)
      render json: @house_image
    else
      render json: @house_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /house_images/1
  def destroy
    @house_image.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house_image
      @house_image = HouseImage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def house_image_params
      params.require(:house_image).permit(:house_id, :image)
    end
end
