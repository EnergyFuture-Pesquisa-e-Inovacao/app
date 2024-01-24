# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  #include UsersHelper

    # GET /resource/sign_in
    #def new
    #   puts "create session aqui tem que ficar notifysignin?????"
    #   super
    #end
  
    # POST /resource/sign_in
    def create
      if current_user.present?
       NotifyRegistrationloginJob.set(wait: 3.seconds).perform_later(current_user)
      end 
      super
    end
  
    # DELETE /resource/sign_out
     def destroy
       super
     end

    #def resource_name
    #  :user
    #end
  
    #def resource
    #  @resource ||= User.new
    #end
  
    #def devise_mapping
    #  @devise_mapping ||= Devise.mappings[:user]
    #end

    # protected
  
    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
    def after_sign_in_path_for(_resource)
      #root_path
      '/home/agenda'
    end
    

    
  end