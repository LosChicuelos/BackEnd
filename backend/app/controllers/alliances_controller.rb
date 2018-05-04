class AlliancesController < ApplicationController
  before_action :set_alliance, only: [:show, :update, :destroy]

  # GET /alliances
  def index
    @alliances = Alliance.paginatedef(params[:page])
    render json: @alliances
  end

  # GET /alliances/:id
  def show
    @alliance = Alliance.find(params[:id])
  end

  # GET /alliances/new
  def new
    @alliance = Alliance.new
  end

  def edit
    @alliance = Alliance.find(params[:id])
  end

  # POST /alliances
  def create
    @alliance = Alliance.new(alliance_params)  
    
    if @alliance.save
      redirect_to @alliance
    else
      render :new
    end
  end

  # PATCH/PUT /alliances/:id
  def update
      @alliance = alliance.find(params[:id])
      if @alliance.update(alliance_params)
        redirect_to @alliance
      else
      render :edit
    end
  end

  # NO aplica Delete
  # DELETE /alliances/:id
=begin
  def destroy
    @alliance = Alliance.find(params[:id])
    @alliance.destroy
    redirect_to alliances_path
  end
=end

  private
    
    def alliance_params
      params.require(:alliance).permit(:commentary, :confirm)
    end
end
