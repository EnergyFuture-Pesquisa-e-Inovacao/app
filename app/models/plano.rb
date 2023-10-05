class Plano < ApplicationRecord
    enum status: { ativo:0, 
    inativo:1 } 

    after_create :notify_registrationplancr

    after_update :notify_registrationplanup
  
    def notify_registrationplancr
      Integromat.configure do |cplano|
            cplano.web_hooks = { pappplano: "9t8v7x3dd29m432oa6lg9chj18g2i9qg"}
            cplano.base_uri = "https://hook.us1.make.com/"
      end   
      Integromat::Webhook.new(:pappplano).trigger(id: id,
                                                     name: name,
                                                     status: status,
                                                     created_at: created_at,
                                                    "tipoacao": "create")
    end
  
    def notify_registrationplanup
        Integromat.configure do |cplano|
            cplano.web_hooks = { pappplano: "9t8v7x3dd29m432oa6lg9chj18g2i9qg"}
            # Override the base URI
            cplano.base_uri = "https://hook.us1.make.com/"
        end     
      Integromat::Webhook.new(:pappplano).trigger(id: id,
                                                     name: name,
                                                     status: status,
                                                     updated_at: updated_at,
                                                    "tipoacao": "update")
    end       
end
