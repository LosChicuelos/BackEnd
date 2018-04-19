require "uri"
require 'net/http'

class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :update, :destroy]

  # GET /photos
  def index
    puts 'Hola2'     
    params = {'email' => 'jframirezg@unal.edu.co',
      'iddocument' => '12345',
      'langitude' => 1.5654646,
      'lastname' => 'Ramirez',
      'latitude' => 2.3456464,
      'name' => 'Jose',
      'password' => '12345',
      'phone' => '12345',
      'typedocument' => '12345',
      'iddocument' => '12345',
      'iddocument' => '12345',
    }
    postData = Net::HTTP.post_form(URI.parse('http://backend-pipemax85.c9users.io/users'), {'email'=>'cfra@unal.edu.co'})
    puts postData.body
    
    @photos = Photo.paginatedef(params[:page])
    render json: @photos
  end

  # GET /photos/1
  def show
    render json: @photo
  end

  # POST /photos
  def create
    @photo = Photo.new(photo_params)

      if @photo.save
      render json: @photo, status: :created, location: @photo
      else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /photos/1
  def update
      if @photo.update(photo_params)
      render json: @photo
      else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /photos/1
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
      params.require(:photo).permit(:date, :photo, :article_id,:photos)
    end
end
