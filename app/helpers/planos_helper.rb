module PlanosHelper

    def notify_registrationplan(tipo)
        Integromat.configure do |cplano|
              cplano.web_hooks = { appv3plano: "7c4xysu5dyv6vgqdp3frhyqmko4xwhnh"}
              cplano.base_uri = "https://hook.us1.make.com/"
        end 
      if tipo=="create"  
        Integromat::Webhook.new(:appv3plano).trigger(id: @plano.id,
                                                     name: @plano.name,
                                                     status: @plano.status,
                                                     created_at: @plano.created_at,
                                                    "tipoacao": "create")
      elsif tipo=="update"   
        Integromat::Webhook.new(:appv3plano).trigger(id: @plano.id,
                                                     name: @plano.name,
                                                     status: @plano.status,
                                                     updated_at: @plano.updated_at,
                                                    "tipoacao": "update")
      end
    end
   
end
