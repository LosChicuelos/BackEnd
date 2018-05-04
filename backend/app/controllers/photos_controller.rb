class PhotosController < ApplicationController
  before_action :set_photo, only: [:new, :show, :update, :destroy]

  # GET /photos
  def index
    @photos = Photo.paginatedef(params[:page])
    render json: @photos
  end

  # GET /articles/new
  def new
    @photo = Photo.new
  end
  

  def show
    @photo = Photo.find(params[:id])
  end

  # POST /articles
  def create
    @photo = Photo.new(photo_params)

      if @photo.save
      render json: @photo, status: :created, location: @photo
      else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/:id
  def update
      if @photo.update(photo_params)
      render json: @photo
      else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/:id
  def destroy
    @photo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def photo_params
      puts params
      params.require(:article_id).permit(:article_id,:photos,:file)
    end
end
