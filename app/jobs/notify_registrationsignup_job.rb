class NotifyRegistrationsignupJob < ApplicationJob

queue_as :default

def perform(objeto)
  Integromat.configure do |csignup|
    csignup.web_hooks = { appv3signup: "t8x4aetsad16zlbhifl96029t28tnktb"}
    csignup.base_uri = "https://hook.us1.make.com/"
   end 
   Integromat::Webhook.new(:appv3signup).trigger(id:objeto.id,
   email: objeto.email,
   name: objeto.name,
   phone: objeto.phone,
   birthdate: objeto.birthdate,
   newsletter: objeto.newsletter,
   status: objeto.status,
   plano:getnameplano(objeto.plano_id),
   icp:getnameicp(objeto.icp_id),                                                   
   created_at: objeto.created_at,
   "tipoacao": "signup")
    return_success(objeto.id)                                          
     
  rescue StandardError => e
    return_error(e)
end

  private
  def getnameplano(id)
    if id.present?
      plano=Plano.find(id)
      plano.name
    end  
  end 
  
  def getnameicp(id)
    if id.present?
      icp=Icp.find(id)
      icp.name
    end  
  end  

  def return_success(userid)
    puts "Enviado para Make com Sucesso: #{userid})"
  end

  def return_error(e)
      puts "Erro ao Enviar para Make: #{e.message}"
  end



end    