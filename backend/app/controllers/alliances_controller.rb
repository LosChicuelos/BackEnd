class AlliancesController < ApplicationController
  #before_action :set_alliance, only: [:show, :update, :destroy]

  # GET /alliances
  def index
    @alliances = Alliance.paginatedef(params[:page])
    render json: @alliances
  end
  
  def belongsuser
    puts params[:user_id]
    puts 'hola1'
    if params[:confirmyes] != nil
        puts 'hola2'
        @alliances = Alliance.belongsuserpending(params[:user_id])
        puts 'hola3'
    else if params[:confirmno] != nil
        @alliances = Alliance.belongsuseronhold(params[:user_id])
    else 
        @alliances = Alliance.belongsuser(params[:user_id])
    end 
    end
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
    puts 'Hola'
    puts alliance_params
    puts 'hola2'
    @alliance = Alliance.new(alliance_params)  
    
    if @alliance.save
      render json: @alliance, status: :created, location: @alliance
      else
      render json: @alliance.errors, status: :unprocessable_entity
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
      params.require(:alliance).permit(:commentary, :confirm, :approval_id, :applicant_id)
    end
end
