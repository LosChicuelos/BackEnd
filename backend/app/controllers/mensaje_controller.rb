class MensajeController < ApplicationController
  def index
    @mensajes = Mensaje.all
    render json: @mensajes
  end
    
  def show
    mensaje = Mensaje.find(params[:id])
    render json: mensaje, status: 200
  end

  def create
    mensaje = Mensaje.new(params)
    if mensaje.save
      render json: mensaje, status: 201
    end
  end

  def update
    if @mensaje.update(params)
      render json: @mensaje
    else
      render json: @mensaje.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @mensaje.destroy
  end
end
