class AlliancesController < ApplicationController
  before_action :set_alliance, only: [:show, :update, :destroy]

  # GET /alliances
  def index
    @alliances = Alliance.paginatedef(params[:page])
    render json: @alliances
  end

  # GET /alliances/:id
  def show
    @alliance = alliance.find(params[:id])
  end

  # POST /alliances
  def create
    @alliance = Alliance.new(alliance_params)

      if @alliance.save
      render json: @alliance, status: :created, location: @alliance
      else
      render json: @alliance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /alliances/:id
  def update
      if @alliance.update(alliance_params)
      render json: @alliance
      else
      render json: @alliance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /alliances/:id
  def destroy
    @alliance.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alliance
      @alliance = Alliance.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def alliance_params
      params.require(:alliance).permit(:commentary, :confirm, :approval_id, :applicant_id)
    end
end