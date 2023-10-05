class Empresa < ApplicationRecord
  belongs_to :plano
  enum status: { ativo:0, 
  inativo:1 }

  after_create :notify_registrationempcr

  after_update :notify_registrationempup

  def notify_registrationempcr
    Integromat.configure do |cempresa|

      cempresa.web_hooks = { appv3empresa: "8qsvwi6llh9av9sw4d34gq0dlp59xw9r"}
  
      # Override the base URI
      cempresa.base_uri = "https://hook.us1.make.com/"
    end 
    Integromat::Webhook.new(:appv3empresa).trigger(id: id,
                                                 plano: getname(plano_id),
                                                 status: status,
                                                 razaosocial: razaosocial,
                                                 nomefantasia: nomefantasia,
                                                 created_at: created_at,
                                                 "tipoacao": "create")
  end

  def notify_registrationempup
    Integromat.configure do |cempresa|

      cempresa.web_hooks = { appv3empresa: "8qsvwi6llh9av9sw4d34gq0dlp59xw9r"}
  
      # Override the base URI
      cempresa.base_uri = "https://hook.us1.make.com/"
    end 
    Integromat::Webhook.new(:appv3empresa).trigger(id: id,
                                                 plano: getname(plano_id),
                                                 status: status,
                                                 razaosocial: razaosocial,
                                                 nomefantasia: nomefantasia,
                                                 updated_at: updated_at,
                                                 "tipoacao": "update")
  end

  def getname(id)
    plano=Plano.find(id)
    plano.name
  end  
 
end
