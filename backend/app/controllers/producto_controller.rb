class ProductoController < ApplicationController
    
  def index
    @productos = Producto.all
    render json: @productos
  end
    
  def show
    producto = Producto.find(params[:id])
    render json: producto, status: 200
  end

  def create
    producto = Producto.new(params)
    if productp.save
      render json: producto, status: 201
    end
  end

  def update
    if @producto.update(params)
      render json: @producto
    else
      render json: @producto.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @producto.destroy
  end
    
end
