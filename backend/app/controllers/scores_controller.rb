class ScoresController < ApplicationController
  before_action :set_score, only: [:show, :update, :destroy]

  # GET /scores
  def index
    @scores = Score.paginatedef(params[:page])

    render json: @scores
  end

  def show
    @score = score.find(params[:id])
  end

  # POST /articles
  def create
    @score = Score.new(score_params)

      if @score.save
      render json: @score, status: :created, location: @score
      else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/:id
  def update
      if @score.update(score_params)
      render json: @score
      else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/:id
  def destroy
    @score.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def score_params
      params.require(:score).permit(:commentary, :score, :sale_id, :qualified_id, :qualifier_id)
    end
end
