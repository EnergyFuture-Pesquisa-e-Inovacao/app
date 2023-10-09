module ProgramasetorialsHelper

def notify_registrationprogsetcr
    Integromat.configure do |cprogset|
     cprogset.web_hooks = { appv3programasetorial: "sj3td7a4iact5qfe9oy2edc5nv49s4lw"}
     cprogset.base_uri = "https://hook.us1.make.com/"
    end 
    Integromat::Webhook.new(:appv3programasetorial).trigger(id: @programasetorial.id,
                                                   name: @programasetorial.name,
                                                   descricao: @programasetorial.descricao,
                                                   descricaocurta: @programasetorial.descricaocurta,
                                                   status: @programasetorial.status,
                                                   ano: @programasetorial.ano,
                                                   empresa: @programasetorial.empresa,
                                                   parceiro: @programasetorial.parceiro,
                                                   quantempresas: @programasetorial.quantempresas,
                                                   quantengajamento: @programasetorial.quantengajamento,
                                                   quantinscricoes: @programasetorial.quantinscricoes,
                                                   descricaocurta: @programasetorial.descricaocurta,
                                                   created_at: @programasetorial.created_at,
                                                  "tipoacao": "create")
  end
              
  def notify_registrationprogsetup
    Integromat.configure do |cprogset|
     cprogset.web_hooks = { appv3programasetorial: "sj3td7a4iact5qfe9oy2edc5nv49s4lw"}
     cprogset.base_uri = "https://hook.us1.make.com/"
    end 
    Integromat::Webhook.new(:appv3programasetorial).trigger(id: @programasetorial.id,
                                                   name: @programasetorial.name,
                                                   descricao: @programasetorial.descricao,
                                                   descricaocurta: @programasetorial.descricaocurta,
                                                   status: @programasetorial.status,
                                                   ano: @programasetorial.ano,
                                                   empresa: @programasetorial.empresa,
                                                   parceiro: @programasetorial.parceiro,
                                                   quantempresas: @programasetorial.quantempresas,
                                                   quantengajamento: @programasetorial.quantengajamento,
                                                   quantinscricoes: @programasetorial.quantinscricoes,
                                                   descricaocurta: @programasetorial.descricaocurta,
                                                   updated_at: @programasetorial.updated_at,
                                                   "tipoacao": "update")
  end

end  