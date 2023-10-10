module AgendasHelper

  def notify_registrationagenda(tipo)
    Integromat.configure do |cagenda|
      cagenda.web_hooks = { appv3agenda: "b1kh3s23i0e78ln5u5gl92xobuvy11nm"}
      cagenda.base_uri = "https://hook.us1.make.com/"
    end 
    if tipo=="create"  
        Integromat::Webhook.new(:appv3agenda).trigger(id: @agenda.id,
                                                       name: @agenda.name,
                                                       descricao: @agenda.descricao,
                                                       descricaocurta: @agenda.descricaocurta,
                                                       status: @agenda.status,
                                                       created_at: @agenda.created_at,
                                                      "tipoacao": "create")
    elsif tipo=="update"
        Integromat::Webhook.new(:appv3agenda).trigger(id: @agenda.id,
                                                      name: @agenda.name,
                                                      descricao: @agenda.descricao,
                                                      descricaocurta: @agenda.descricaocurta,
                                                      status: @agenda.status,
                                                      updated_at: @agenda.updated_at,
                                                     "tipoacao": "update")
    end       
  end  
end
                  

