class UsersController < ApplicationController

  before_action :authenticate_authentication!, :set_user, only: [:show, :update, :destroy]
  
  # GET /users
  def index
    # byebug
    @users = User.paginatedef(params[:page])
    render json: @users, status: :ok
  end

  # GET /users/1
  def show
    
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
      if @user.save
      render json: @user, status: :created, location: @user
      else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
      if @user.update(user_params)
      render json: @user
      else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :lastname, :typeuser, :iddocument, :typedocument, :email, :phone, :latitude, :langitude, :password)
    end
end
