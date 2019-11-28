class WelcomeController < ApplicationController
    skip_before_action :ensure_user_signed_up
    
    def index
    end
end