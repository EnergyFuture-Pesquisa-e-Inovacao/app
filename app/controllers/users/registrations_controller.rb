# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
    #before_action :configure_sign_up_params, only: [:create]
    # before_action :configure_account_update_params, only: [:update]
    #after_action :welcome_new_user, only: [:create]
    before_action :configure_permitted_parameters
  
    # GET /resource/sign_up
    def new
      super
    end
  
    # POST /resource
    def create
      super
    end
  
    # GET /resource/edit
    # def edit
    #   super
    # end
  
    # PUT /resource
    # def update
    #   super
    # end
  
    # DELETE /resource
    # def destroy
    #   super
    # end
  
    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end



 

    def poscreate
      @user.status='ativo'
      plano=Plano.find_by(name: 'Free')
      @user.plano_id=plano.id
      if @user.save
        registrationsignup
      end  
    end 

    def registrationsignup
      Integromat.configure do |csignup|
        csignup.web_hooks = { appv3signup: "t8x4aetsad16zlbhifl96029t28tnktb"}
        
         # Override the base URI
        csignup.base_uri = "https://hook.us1.make.com/"
      end 
      Integromat::Webhook.new(:appv3signup).trigger(id:@user.id,
                                                   email: @user.email,
                                                   name: @user.name,
                                                   phone: @user.phone,
                                                   birthdate: @user.birthdate,
                                                   newsletter: @user.newsletter,
                                                   status: @user.status,
                                                   plano:getnameplano(@user.plano_id),
                                                   icp:getnameicp(@user.icp_id),                                                   
                                                   created_at: @user.created_at,
                                                  "tipoacao": "signup")
    end
    def getnameplano(id)
      plano=Plano.find(id)
      plano.name
    end 
    def getnameicp(id)
      icp=Icp.find(id)
      icp.name
    end 
  
    # protected
  
    # If you have extra params to permit, append them to the sanitizer.
    #def configure_sign_up_params
    #  devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    #end

    def configure_permitted_parameters
      added_attrs = [:name,:phone,:icp_id,:newsletter]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
  
    # If you have extra params to permit, append them to the sanitizer.
    # def configure_account_update_params
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    # end
  
    # The path used after sign up.
    def after_sign_up_path_for(_resource)
      #root_path
       #poscreate
      '/home/agenda'
    end
  
    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end
  end