module UsersHelper

  def registrationlogin
    Integromat.configure do |clogin|
      clogin.web_hooks = { appv3login: "8wslib9amp5yokykmfgkpilsl6k41q8m"}
      clogin.base_uri = "https://hook.us1.make.com/"
     end 
     Integromat::Webhook.new(:appv3login).trigger(id: current_user.id,
                                                  email: current_user.email,
                                                  datahora:DateTime.current - 3.hours,
                                                  "tipoacao": "login")
  end

  def registrationsignup
    Integromat.configure do |csignup|
      csignup.web_hooks = { appv3signup: "t8x4aetsad16zlbhifl96029t28tnktb"}
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






end
