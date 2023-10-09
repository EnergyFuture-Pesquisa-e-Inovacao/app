module IcpsHelper

    def notify_registrationicpcr
        Integromat.configure do |cicp|
          cicp.web_hooks = { appv3icp: "70lfk6xhezafga1cvuqaqon8smqfbfj4"}
          cicp.base_uri = "https://hook.us1.make.com/"
        end   
        Integromat::Webhook.new(:appv3icp).trigger(id: @icp.id,
                                                  name: @icp.name,
                                                  status: @icp.status,
                                                  created_at: @icp.created_at,
                                                  "tipoacao": "create")
      end
    
      def notify_registrationicpup
         Integromat.configure do |cicp|
          cicp.web_hooks = { appv3icp: "70lfk6xhezafga1cvuqaqon8smqfbfj4"}
          cicp.base_uri = "https://hook.us1.make.com/"
        end           
        Integromat::Webhook.new(:appv3icp).trigger(id: @icp.id,
                                                  name: @icp.name,
                                                  status: @icp.status,
                                                  updated_at: @icp.updated_at,
                                                  "tipoacao": "update")
      end   
end
