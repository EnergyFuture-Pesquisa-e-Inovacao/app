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
                                                   updated_at: @programasetorial.updated_at,
                                                   "tipoacao": "update")    
  end  
end

def notify_registrationappv3ctaprogramasetorial1
  Integromat.configure do |cprogsetcta1|
    cprogsetcta1.web_hooks = { appv3ctaprogramasetorial1: "stmfmbt28ui2e6r3w3mi4ph29awt6hz4"}
    cprogsetcta1.base_uri = "https://hook.us1.make.com/"
  end 
  Integromat::Webhook.new(:appv3ctaprogramasetorial1).trigger(id: @programasetorial.id,
                                                   name: @programasetorial.name,
                                                   ano: @programasetorial.ano,
                                                   data: date_formatnormal(DateTime.current),
                                                   hora: time_format(DateTime.current - 3.hours),
                                                   user_id: @user.id,
                                                   user_name: @user.name)
end

 def preparahoras(tempo)
  #tempo em minutos
  if tempo.to_f<60
    tempo=tempo+ " minutos"
  else
    #tempo=(tempo.to_f)+ " minutos"
  end 
end              

end
