class ApplicationController < ActionController::Base
    #before_action :authenticate_user!
    #before_action :authenticate_admin!
    def not_found_method
        render file: Rails.public_path.join('404.html'), status: :not_found, layout: true
    end
end
