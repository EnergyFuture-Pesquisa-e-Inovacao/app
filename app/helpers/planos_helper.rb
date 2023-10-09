module PlanosHelper

    def notify_registrationplancr
        Integromat.configure do |cplano|
              cplano.web_hooks = { pappplano: "7c4xysu5dyv6vgqdp3frhyqmko4xwhnh"}
              cplano.base_uri = "https://hook.us1.make.com/"
        end   
        Integromat::Webhook.new(:pappplano).trigger(id: @plano.id,
                                                    name: @plano.name,
                                                    status: @plano.status,
                                                    created_at: @plano.created_at,
                                                    "tipoacao": "create")
      end
    
      def notify_registrationplanup
          Integromat.configure do |cplano|
              cplano.web_hooks = { pappplano: "7c4xysu5dyv6vgqdp3frhyqmko4xwhnh"}
              cplano.base_uri = "https://hook.us1.make.com/"
          end     
        Integromat::Webhook.new(:pappplano).trigger(id: @plano.id,
                                                    name: @plano.name,
                                                    status: @plano.status,
                                                    updated_at: @plano.updated_at,
                                                    "tipoacao": "update")
      end     
end
