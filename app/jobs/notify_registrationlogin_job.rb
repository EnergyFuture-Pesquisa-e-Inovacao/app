class NotifyRegistrationloginJob < ApplicationJob

queue_as :default

def perform(objeto)
  Integromat.configure do |clogin|
    clogin.web_hooks = { appv3login: "8wslib9amp5yokykmfgkpilsl6k41q8m"}
    clogin.base_uri = "https://hook.us1.make.com/"
   end  
   Integromat::Webhook.new(:appv3login).trigger(id: objeto.id,
   email: objeto.email,
   datahora:DateTime.current - 3.hours,
   "tipoacao": "login")
    return_success(objeto.id)                                          
     
  rescue StandardError => e
    return_error(e)
end

  private

  def return_success(userid)
    puts "Enviado para Make com Sucesso: #{userid})"
  end

  def return_error(e)
      puts "Erro ao Enviar para Make: #{e.message}"
  end



end    