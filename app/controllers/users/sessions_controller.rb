# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]
    after_action :user_logou, only: [:create ] 
    # GET /resource/sign_in
    def new
       super
    end
  
    # POST /resource/sign_in
    def create
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

    def user_logou
      ZapierRuby.configure do |c|
       c.web_hooks = {user_logou: "10142775/39vrf61"}
      end 
      ZapierRuby::Zapper.new(:user_logou).zap(@user)
    end
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