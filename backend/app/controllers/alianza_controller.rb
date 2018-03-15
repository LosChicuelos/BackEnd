class AlianzaController < ApplicationController
  def index
    @alianzas = Alianza.all
    render json: @alianzas
  end
    
  def show
    alianza = Alianza.find(params[:id])
    render json: alianza, status: 200
  end

  def create
    alianza = Alianza.new(params)
    if alianza.save
      render json: alianza, status: 201
    end
  end

  def update
    if @alianza.update(params)
      render json: @alianza
    else
      render json: @alianza.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @alianza.destroy
  end
end
