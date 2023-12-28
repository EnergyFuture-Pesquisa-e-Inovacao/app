class NotifyRegistrationupuserJob < ApplicationJob

queue_as :default

def perform(objeto)
  Integromat.configure do |cupuser|
    cupuser.web_hooks = { appv3upuser: "nt87wcmlin5cf16npf1av81sbvwxamnc"}
    cupuser.base_uri = "https://hook.us1.make.com/"
  end 
  Integromat::Webhook.new(:appv3upuser).trigger(id:objeto.id,
  email: objeto.email,
  name: objeto.name,
  phone: objeto.phone,
  birthdate: objeto.birthdate,
  newsletter: objeto.newsletter,
  status: objeto.status,
  plano:getnameplano(objeto.plano_id),
  icp:getnameicp(objeto.icp_id),  
  empresa:getnameempresa(objeto.empresa_id),                                                  
  updated_at: objeto.updated_at,
 "tipoacao": "update")
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

  def getnameempresa(id)
    if id.present?
     empresa=Empresa.find(id)
     empresa.nomefantasia
    end 
  end 

  def return_success(userid)
    puts "Enviado para Make com Sucesso: #{userid})"
  end

  def return_error(e)
      puts "Erro ao Enviar para Make: #{e.message}"
  end



end    