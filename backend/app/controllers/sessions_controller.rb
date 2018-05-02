class SessionsController < ApplicationController
       
     # GET /users
     def index
        @session = Authentication.all
        render json: @session
      end
    
    
    def show
        @session = Authentication.find(params[:id])
        render json: @session
    end

    def create
        authentication = Authentication.where(email: params[:email]).first
        if authentication&.valid_password?(params[:password])
            render json: authentication.as_json(only: [:email, :authentication_token]), status: :created
        else
            head(:unauthorized)
        end
    end

    def destroy
        # byebug
        current_authentication&.authentication_token = nil
        if current_authentication.save
            
            head(:ok)
        else 
            head(:unauthorized)
        end
    end

    private
   
    def session_params
      params.require(:session).permit(:email, :password, :password_confirmation)
    end
    
end

