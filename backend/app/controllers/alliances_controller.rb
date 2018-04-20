class AlliancesController < ApplicationController
  before_action :set_alliance, only: [:show, :update, :destroy]

  # GET /alliances
  def index
    @alliances = Alliance.paginatedef(params[:page])
    render json: @alliances
  end

  # GET /alliances/:id
  def show
<<<<<<< HEAD
    @alliance = alliance.find(params[:id])
=======
    @alliance = Alliance.find(params[:id])
  end

  # GET /alliances/new
  def new
    @alliance = Alliance.new
  end

  def edit
    @alliance = Alliance.find(params[:id])
>>>>>>> 29ee22455e56b451f562a77a65aee1ec9c0e360c
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

<<<<<<< HEAD
  # PATCH/PUT /alliances/:id
=======
  # PUT /alliances/:id
>>>>>>> 29ee22455e56b451f562a77a65aee1ec9c0e360c
  def update
      @alliance = alliance.find(params[:id])
      if @alliance.update(alliance_params)
        redirect_to @alliance
      else
      render :edit
    end
  end

<<<<<<< HEAD
  # DELETE /alliances/:id
=======
  # NO aplica Delete
  # DELETE /alliances/:id
=begin
>>>>>>> 29ee22455e56b451f562a77a65aee1ec9c0e360c
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
<<<<<<< HEAD
end
=======
  end
>>>>>>> 29ee22455e56b451f562a77a65aee1ec9c0e360c
