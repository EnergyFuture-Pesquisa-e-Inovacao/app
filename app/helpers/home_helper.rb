module HomeHelper

  def getresppropdi(id)
    resposta= {"Histórico de projetos de P&D atualizado":0, 
    "Documentos em vigor":1,
    "Eventos da ANEEL":2, 
    "Organograma da ANEEL":3}
    resposta.key(id.to_i)
  end

  def getrespacademy(id)
    resposta= {"Histórico de projetos de P&D atualizado":0, 
    "Documentos em vigor":1,
    "Eventos da ANEEL":2, 
    "Organograma da ANEEL":3}
    resposta.key(id.to_i)
  end 



  def notify_registrationresppropdi(puser_id,puser_name,presposta)
    Integromat.configure do |cresp|
      cresp.web_hooks = { appv3resppropdi: "o19wpn3loo1zix5jpvxmtjdzx5tdip6l"}
      cresp.base_uri = "https://hook.us1.make.com/"
    end   
  
    Integromat::Webhook.new(:appv3resppropdi).trigger(user_id: puser_id,
                                               username: puser_name,
                                               resposta: presposta,
                                               datahora:DateTime.current - 3.hours) 
  end

  def notify_registrationrespacademy(puser_id,puser_name,presposta)
    Integromat.configure do |cresp|
      cresp.web_hooks = { appv3respacademy: "iu00uqcwldawyqpg9bfoyvfetn94u49r"}
      cresp.base_uri = "https://hook.us1.make.com/"
    end   
  
    Integromat::Webhook.new(:appv3respacademy).trigger(user_id: puser_id,
                                               username: puser_name,
                                               resposta: presposta,
                                               datahora:DateTime.current - 3.hours) 
  end


end
