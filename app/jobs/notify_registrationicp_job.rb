class NotifyRegistrationicpJob < ApplicationJob

queue_as :default

def perform(tipo,objeto)
  Integromat.configure do |cicp|
    cicp.web_hooks = { appv3icp: "70lfk6xhezafga1cvuqaqon8smqfbfj4"}
    cicp.base_uri = "https://hook.us1.make.com/"
  end  
  
  if tipo=="create"
    Integromat::Webhook.new(:appv3icp).trigger(id: objeto.id,
                                              name: objeto.name,
                                              status: objeto.status,
                                              created_at: objeto.created_at,
                                              "tipoacao": "create")
    return_success(objeto.id)                                          
  elsif tipo=="update" 
    Integromat::Webhook.new(:appv3icp).trigger(id: objeto.id,
    name: objeto.name,
    status: objeto.status,
    updated_at: objeto.updated_at,
    "tipoacao": "update") 
    return_success(objeto.id)      
  end    
  rescue StandardError => e
    return_error(e)
end

  private

  def return_success(icpid)
    puts "Enviado para Make com Sucesso: #{icpid})"
  end

  def return_error(e)
      puts "Erro ao Enviar para Make: #{e.message}"
  end



end    