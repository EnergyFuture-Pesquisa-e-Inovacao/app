module AgendasHelper

  def notify_registrationagenda(tipo)
    Integromat.configure do |cagenda|
      cagenda.web_hooks = { appv3agenda: "seyvmdff1b56zcse9lq81dqvahuloj3d"}
      cagenda.base_uri = "https://hook.us1.make.com/"
    end 
    if tipo=="create"  
        Integromat::Webhook.new(:appv3agenda).trigger(id: @agenda.id,
                                                       name: @agenda.name,
                                                       descricao: @agenda.descricao,
                                                       descricaocurta: @agenda.descricaocurta,
                                                       status: @agenda.status,
                                                       ano: @agenda.ano,
                                                       empresa: @agenda.empresa,
                                                       parceiro: @agenda.parceiro,
                                                       quantempresas: @agenda.quantempresas,
                                                       quantengajamento: @agenda.quantengajamento,
                                                       quantinscricoes: @agenda.quantinscricoes,
                                                       descricaocurta: @agenda.descricaocurta,
                                                       created_at: @agenda.created_at,
                                                      "tipoacao": "create")
    elsif tipo=="update"
        Integromat::Webhook.new(:appv3agenda).trigger(id: @agenda.id,
                                                      name: @agenda.name,
                                                      descricao: @agenda.descricao,
                                                      descricaocurta: @agenda.descricaocurta,
                                                      status: @agenda.status,
                                                      ano: @agenda.ano,
                                                      empresa: @agenda.empresa,
                                                      parceiro: @agenda.parceiro,
                                                      quantempresas: @agenda.quantempresas,
                                                      quantengajamento: @agenda.quantengajamento,
                                                      quantinscricoes: @agenda.quantinscricoes,
                                                      descricaocurta: @agenda.descricaocurta,
                                                      updated_at: @agenda.updated_at,
                                                     "tipoacao": "update")
    end       
  end  
end
                  

