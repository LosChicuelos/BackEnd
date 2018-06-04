class ApplicationController < ActionController::API

    before_action :configure_permitted_parameters, if: :devise_controller?

    respond_to :html, :json

    protected

    def configure_permitted_parameters
        attributes = [:typeuser, :typedocument, :phone, :latitude, :langitude, :name, :email, :lastname, :iddocument, :confirmation]
        devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
        devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end

end
