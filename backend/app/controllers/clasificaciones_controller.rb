class ClasificacionesController < ApplicationController
  # GET /clasificaciones
  def index
    @clasificaciones = Clasificacion.all
    render json: @clasificaciones
  end
    
  def show
    clasificacion = Clasificacion.find(params[:id])
    render json: clasificacion, status: 200
  end

  def create
    clasificacion = Clasificacion.new(params)
    if clasificacion.save
      render json: clasificacion, status: 201
    end
  end

  def update
    if @clasificacion.update(params)
      render json: @clasificacion
    else
      render json: @clasificacion.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @clasificacion.destroy
  end

end
