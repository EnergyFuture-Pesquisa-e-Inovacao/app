module EmpresasHelper

  def planos_for_select
    Plano.all.collect { |m| [m.name, m.id] }
  end

  def notify_registrationempcr
    Integromat.configure do |cempresa|
      cempresa.web_hooks = { appv3empresa: "8qsvwi6llh9av9sw4d34gq0dlp59xw9r"}
      cempresa.base_uri = "https://hook.us1.make.com/"
    end 
    Integromat::Webhook.new(:appv3empresa).trigger(id: @empresa.id,
                                                 plano: @empresa.getname(plano_id),
                                                 status: @empresa.status,
                                                 razaosocial: @empresa.razaosocial,
                                                 nomefantasia: @empresa.nomefantasia,
                                                 created_at: @empresa.created_at,
                                                 "tipoacao": "create")
  end

  def notify_registrationempup
    Integromat.configure do |cempresa|
      cempresa.web_hooks = { appv3empresa: "8qsvwi6llh9av9sw4d34gq0dlp59xw9r"}
      cempresa.base_uri = "https://hook.us1.make.com/"
    end 
    Integromat::Webhook.new(:appv3empresa).trigger(id: @empresa.id,
                                                 plano: @empresa.getname(plano_id),
                                                 status: @empresa.status,
                                                 razaosocial: @empresa.razaosocial,
                                                 nomefantasia: @empresa.nomefantasia,
                                                 updated_at: @empresa.updated_at,
                                                 "tipoacao": "update")
  end

  def getname(id)
    plano=Plano.find(id)
    plano.name
  end  
    
end
