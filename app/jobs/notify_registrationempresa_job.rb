class NotifyRegistrationempresaJob < ApplicationJob

queue_as :default

def perform(tipo,objeto)
  Integromat.configure do |cempresa|
    cempresa.web_hooks = { appv3empresa: "8qsvwi6llh9av9sw4d34gq0dlp59xw9r"}
    cempresa.base_uri = "https://hook.us1.make.com/"
  end 
  
  if tipo=="create"
    Integromat::Webhook.new(:appv3empresa).trigger(id: objeto.id,
    plano: getname(objeto.plano_id),
    status: objeto.status,
    razaosocial: objeto.razaosocial,
    nomefantasia: objeto.nomefantasia,
    created_at: objeto.created_at,
   "tipoacao": "create")
    return_success(objeto.id)                                          
  elsif tipo=="update" 
    Integromat::Webhook.new(:appv3empresa).trigger(id: objeto.id,
    plano: getname(objeto.plano_id),
    status: objeto.status,
    razaosocial: objeto.razaosocial,
    nomefantasia: objeto.nomefantasia,
    updated_at: objeto.updated_at,
    "tipoacao": "update") 
    return_success(objeto.id)      
  end    
  rescue StandardError => e
    return_error(e)
end

  private

  def getname(id)
    plano=Plano.find(id)
    plano.name
  end  

  def return_success(empresaid)
    puts "Enviado para Make com Sucesso: #{empresaid})"
  end

  def return_error(e)
      puts "Erro ao Enviar para Make: #{e.message}"
  end



end    