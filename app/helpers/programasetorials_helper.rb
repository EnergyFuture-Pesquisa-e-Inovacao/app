module ProgramasetorialsHelper

def notify_registrationprogset(tipo)
  Integromat.configure do |cprogset|
    cprogset.web_hooks = { appv3programasetorial: "ogu2esvqze7quy6weld5rpaa67al35te"}
    cprogset.base_uri = "https://hook.us1.make.com/"
  end 
  if tipo=="create"
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
  elsif tipo=="update"
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
              

end  