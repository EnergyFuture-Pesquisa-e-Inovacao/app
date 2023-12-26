class ApplicationController < ActionController::Base
    #before_action :authenticate_user!
    #before_action :authenticate_admin!
    def not_found_method
        render file: Rails.public_path.join('404.html'), status: :not_found, layout: true
    end

    def loginterno
        if current_user.present?
          adminuseid=current_user.id
          permissuser=1
        elsif current_admin.present?  
          adminuseid=current_admin.id
          permissuser=0
        end  
        CreateLoginternoJob.set(wait: 3.seconds).perform_later(adminuseid,permissuser,params[:controller]+"/"+params[:action])
      end 
         
    
    def verificauser
      if current_user.present?
        true 
      elsif current_admin.present?
        true
      else  
        false
      end  
    end  
    
    def verificaadminteste
      if current_admin.present?
        true
      else
        false
      end  
    end 




end
