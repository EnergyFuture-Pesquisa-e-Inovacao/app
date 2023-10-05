class Icp < ApplicationRecord
    enum status: { ativo:0, 
    inativo:1 }  
    
    

 
    after_create :notify_registrationicpcr

    after_update :notify_registrationicpup
  
    def notify_registrationicpcr
      Integromat.configure do |cicp|
        cicp.web_hooks = { pappicp: "u5ysb8nqkxv6t8fqy6kb24724gzl0d9x"}
        
         # Override the base URI
        cicp.base_uri = "https://hook.us1.make.com/"
      end   
      Integromat::Webhook.new(:pappicp).trigger(id: id,
                                                     name: name,
                                                     status: status,
                                                     created_at: created_at,
                                                     "tipoacao": "create")
    end
  
    def notify_registrationicpup
       Integromat.configure do |cicp|
        cicp.web_hooks = { pappicp: "u5ysb8nqkxv6t8fqy6kb24724gzl0d9x"}
            
        # Override the base URI
        cicp.base_uri = "https://hook.us1.make.com/"
      end           
      Integromat::Webhook.new(:pappicp).trigger(id: id,
                                                     name: name,
                                                     status: status,
                                                     updated_at: updated_at,
                                                     "tipoacao": "update")
    end   

end
