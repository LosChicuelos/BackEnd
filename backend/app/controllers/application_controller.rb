class ApplicationController < ActionController::API
    # la siguiente linea nos permite el uso del metodo respond_to en StatisticsController
    include ActionController::MimeResponds
    acts_as_token_authentication_handler_for Authentication, fallback: :none
end
