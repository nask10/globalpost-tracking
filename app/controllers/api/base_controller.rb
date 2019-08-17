# The Api::BaseController class is the template for the different endpoints
# in this app's API. It inherits from ApplicationController
# and all controllers inside this folder inherit from this class

class Api::BaseController < ApplicationController
    protect_from_forgery with: :null_session
    skip_before_action :authenticate_user!
    before_action :authenticate_request

    def authenticate_request
        if request.headers['X-GLOBALPOST-SYS'] == ENV['GLOBALPOST_APP_KEY']
            return true
        else
            render json: {message: 'Not authorized!'}, status: :unauthorized
        end
    end
end