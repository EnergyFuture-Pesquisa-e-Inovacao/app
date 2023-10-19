module ArquivosHelper

    #def notify_registrationicp(tipo)
    #    Integromat.configure do |cicp|
    #      cicp.web_hooks = { appv3icp: "jsmy8x4to6n1lb9b7l6h6mby3vgu1osz"}
    #      cicp.base_uri = "https://hook.us1.make.com/"
    #    end   
    #    if tipo=="create"
    #      Integromat::Webhook.new(:appv3icp).trigger(id: @icp.id,
    #                                                name: @icp.name,
    #                                                status: @icp.status,
    #                                                created_at: @icp.created_at,
    #                                                "tipoacao": "create")
    #    elsif tipo=="update" 
    #      Integromat::Webhook.new(:appv3icp).trigger(id: @icp.id,
    #      name: @icp.name,
    #      status: @icp.status,
    #      updated_at: @icp.updated_at,
    #      "tipoacao": "update")       
    #    end  
    #end
    
end
