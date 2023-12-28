class NotifyRegistrationplanJob < ApplicationJob

queue_as :default

def perform(tipo,objeto)
  Integromat.configure do |cplano|
    cplano.web_hooks = { appv3plano: "7c4xysu5dyv6vgqdp3frhyqmko4xwhnh"}
    cplano.base_uri = "https://hook.us1.make.com/"
 end 
  
  if tipo=="create"
    Integromat::Webhook.new(:appv3plano).trigger(id: objeto.id,
    name: objeto.name,
    status: objeto.status,
    created_at: objeto.created_at,
   "tipoacao": "create")
    return_success(objeto.id)                                          
  elsif tipo=="update" 
    Integromat::Webhook.new(:appv3plano).trigger(id: objeto.id,
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

  def return_success(planoid)
    puts "Enviado para Make com Sucesso: #{planoid})"
  end

  def return_error(e)
      puts "Erro ao Enviar para Make: #{e.message}"
  end



end    