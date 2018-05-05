class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :update, :destroy]

  # GET /sales
  def index
    @sales = Sale.paginatedef(params[:page])
    render json: @sales
  end

  def show
    @sale = sale.find(params[:id])
  end

  # POST /articles
  def create
    @sale = Sale.new(sale_params)

      if @sale.save
        
      #Con la siguiente linea se envia un correo al vendedor, por cada nueva compra.
      NotifySellerMailer.notify(@sale).deliver_now
      
      render json: @sale, status: :created, location: @sale
      else
      render json: @sale.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/:id
  def update
      if @sale.update(sale_params)
      render json: @sale
      else
      render json: @sale.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/:id
  def destroy
    @sale.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sale_params
      params.require(:sale).permit(:date, :quantity, :amount, :seller_id, :buyer_id, :article_id)
    end
end
