class UsuarioController < ApplicationController
  def index
    @usuarios = Usuario.all
    render json: @usuarios
  end
    
  def show
    usuario = Usuario.find(params[:id])
    render json: usuario, status: 200
  end

  def create
    usuario = Usuario.new(params)
    if usuario.save
      render json: usuario, status: 201
    end
  end

  def update
    if @usuario.update(params)
      render json: @usuario
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @usuario.destroy
  end
end
