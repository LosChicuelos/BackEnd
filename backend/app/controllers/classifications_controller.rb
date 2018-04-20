class ClassificationsController < ApplicationController
  before_action :set_classification, only: [:show, :update, :destroy]

  # GET /classifications
  def index
    @classifications = Classification.paginatedef(params[:page])
    render json: @classifications
  end

  # GET /articles/:id
  def show
    @classification = classification.find(params[:id])
  end

  # POST /articles
  def create
    @classification = Classification.new(clasification_params)

      if @classification.save
      render json: @classification, status: :created, location: @article
      else
      render json: @classification.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/:id
  def update
      if @classification.update(clasification_params)
      render json: @classification
      else
      render json: @classification.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/:id
=begin
  def destroy
    @classification.destroy
  end
=end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clasification
      @classification = Classification.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def classification_params
      params.require(:classification).permit(:name)
    end
end