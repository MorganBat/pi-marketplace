class ApplicationController < ActionController::Base
    # Force devise authentication
    before_action :authenticate_user!
end
