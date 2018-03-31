class AlliancesController < ApplicationController
  before_action :set_alliance, only: [:show, :update, :destroy]

  # GET /alliances
  def index
    @alliances = Alliance.paginate(:page => params[:page], :per_page => 5)

    render json: @alliances
  end

  # GET /alliances/1
  def show
    render json: @alliance
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

  # PATCH/PUT /alliances/1
  def update
      if @alliance.update(alliance_params)
      render json: @alliance
      else
      render json: @alliance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /alliances/1
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
