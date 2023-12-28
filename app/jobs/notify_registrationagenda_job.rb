class NotifyRegistrationagendaJob < ApplicationJob

queue_as :default

def perform(tipo,objeto)
  Integromat.configure do |cagenda|
    cagenda.web_hooks = { appv3agenda: "b1kh3s23i0e78ln5u5gl92xobuvy11nm"}
    cagenda.base_uri = "https://hook.us1.make.com/"
  end 
  
  if tipo=="create"
    Integromat::Webhook.new(:appv3agenda).trigger(id: objeto.id,
    name: objeto.name,
    descricao: objeto.descricao,
    descricaocurta: objeto.descricaocurta,
    status: objeto.status,
    created_at: objeto.created_at,
   "tipoacao": "create")
    return_success(objeto.id)                                          
  elsif tipo=="update" 
    Integromat::Webhook.new(:appv3agenda).trigger(id: objeto.id,
    name: objeto.name,
    descricao: objeto.descricao,
    descricaocurta: objeto.descricaocurta,
    status: objeto.status,
    updated_at: objeto.updated_at,
   "tipoacao": "update")
    return_success(objeto.id)      
  end    
  rescue StandardError => e
    return_error(e)
end

  private

  def return_success(agendaid)
    puts "Enviado para Make com Sucesso: #{agendaid})"
  end

  def return_error(e)
      puts "Erro ao Enviar para Make: #{e.message}"
  end



end    