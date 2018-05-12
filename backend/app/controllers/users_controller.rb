class UsersController < ApplicationController
#require 'gruff'

  
  # GET /users
  def index
    # byebug
    
    @users = User.paginatedef(params[:page])
    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
  end

  # POST /usuarios
  def create
    puts "------ljlkjlkjlkjlAAAAAAAAAAAAAAAAAAAAAAAA---"
    @user = User.new(user_params)

      if @user.save
        render json: @user, status: :created
      end
    
  end


  # PATCH/PUT /articles/:id
  def update
      if @user.update(user_params)
      render json: @user
      else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/:id
  def destroy
    @user.destroy
  end
  
# Con este metodo enviamos la verificacion de si existe un usuario con el correo enviado como parametro
  def emailverification
    @user = User.email_verification(params[:email])
    render json: @user
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit( :typeuser, :iddocument, :typedocument, :email, :phone, :latitude, :langitude, :password, :password_confirmation)
    end
end
