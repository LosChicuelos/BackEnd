class SessionsController < ApplicationController
    def create
        authentication = Authentication.where(email: params[:email]).first
        if authentication&.valid_password?(params[:password])
            render json: authentication.as_json(only: [:email, :authentication_token]), status: :created
        else
            head(:unauthorized)
        end
    end

    def destroy
    end
end