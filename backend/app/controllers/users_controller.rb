class UsersController < ApplicationController
#require 'gruff'

  before_action :authenticate_authentication!, :set_user, only: [:show, :update, :destroy]
  
  # GET /users
  def index
    # byebug
#    g = Gruff::Line.new
#    g.title = 'Wow!  Look at this!'
#    g.labels = { 0 => '5/6', 1 => '5/15', 2 => '5/24', 3 => '5/30', 4 => '6/4',
#             5 => '6/12', 6 => '6/21', 7 => '6/28' }
#    g.data :Jimmy, [25, 36, 86, 39, 25, 31, 79, 88]
#    g.data :Charles, [80, 54, 67, 54, 68, 70, 90, 95]
#    g.data :Julie, [22, 29, 35, 38, 36, 40, 46, 57]
#    g.data :Jane, [95, 95, 95, 90, 85, 80, 88, 100]
#    g.data :Philip, [90, 34, 23, 12, 78, 89, 98, 88]
#    g.data :Arthur, [5, 10, 13, 11, 6, 16, 22, 32]
#    g.write('exciting.png')
    
    @users = User.paginatedef(params[:page])
    render json: @users, status: :ok
  end

  def show
    @user = user.find(params[:id])
  end

  # POST /articles
  def create
    @user = User.new(user_params)

      if @user.save
      
      #Con la siguiente linea se envia el correo de bienvenida.
      WelcomeUserMailer.notify(@user).deliver_now
      render json: @user, status: :created, location: @user
      else
      render json: @user.errors, status: :unprocessable_entity
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
