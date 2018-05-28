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
    render json: @users
  end

  # POST /usuarios
  def create
    
    @user = User.new(user_params)
    @user.confirmation = false

      if @user.save
        
        #Con la siguiente linea se envia un correo de confirmacion de email, al nuevo usuario.
        #WelcomeUserMailer.delay.notify(@user)  #later(wait: 30.seconds)
        WelcomeUserMailer.confirmation(@user).deliver_now
        
        render json: @user, status: :created

      else

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

# Con este metodo recibimos la confirmacion del email del usuario.
  def confirmation
    @user = User.find_by(params[:iduser])
    @user.confirmation = true
    
    if @user.save
        
        #Con la siguiente linea se envia un correo de bienvenida al nuevo usuario.
        #WelcomeUserMailer.delay.notify(@user)  #later(wait: 30.seconds)
        WelcomeUserMailer.notify(@user).deliver_now
        
        render json: { id: @user.id, rta: true}

    else
        @user.confirmation = false
        render json: { id: @user.id, rta: false}
    end
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
      params.require(:user).permit(:name, :lastname, :typeuser, :iddocument, :typedocument, :email, :phone, :latitude, :langitude, :password, :password_confirmation)
    end
end
