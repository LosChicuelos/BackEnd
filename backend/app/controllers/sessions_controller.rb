class SessionsController < ApplicationController

    # GET /users
    def index
        @session = User.all
        render json: @session
    end
        
        
    def show
        @session = User.find(params[:id])
        render json: @session
    end
    

    
    def create
        puts "--------"
        puts params[:email]

        user = User.where(email: params[:email]).first

    
        if user&.valid_password?(params[:password])
             puts "******************"
            render json: user.as_json(only: [:id,:email]), status: :created
        else
             puts "**"
             head(:unathorized)
        end
    end


    def destroy
        # byebug
        current_user&.authentication_token = nil
        if current_user.save
            
            head(:ok)
        else 
            head(:unauthorized)
        end
    end

    private
   
    def session_params
      params.require(:session).permit(:email, :password, :password_confirmation)
    end
    
    
    
    def destroy
    end
    

end