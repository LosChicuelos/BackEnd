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
    @session = Authentication.find(params[:id])
        render json: @session
    end
    
    
    
    def destroy
    end
    
    private
    
        def session_params
          params.require(:session).permit(:email, :password, :password_confirmation)
        end
        


end