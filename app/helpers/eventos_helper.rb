module EventosHelper
  def notify_registrationeventoprogramasetorial(tipo)
    Integromat.configure do |cevento|
      cevento.web_hooks = { appv3evento: "dlgmg7d0wf2cqg4enqyjx6rfq5vs1c5o"}
      cevento.base_uri = "https://hook.us1.make.com/"
    end  
    if tipo=='add'
      Integromat::Webhook.new(:appv3evento).trigger(id: @evento.id,
                                                    idobjeto: @evento.idobjeto,
                                                    tipoobjeto:@evento.tipoobjeto,
                                                    status: @evento.status,
                                                    enviarparaparticipante: @evento.enviarparaparticipante,
                                                    datainicio: @evento.datainicio,
                                                    datafim: @evento.datafim,
                                                    horainicio: @evento.horainicio,
                                                    horafim: @evento.horafim,
                                                    duration: @evento.duration,
                                                    created_at: @evento.created_at,
                                                    "tipoacao": "addeventoprogramasetorial",
                                                    idprogramasetorial: @programasetorial.id,
                                                    nomeprogramasetorial: @programasetorial.name,
                                                    anoprogramasetorial: @programasetorial.ano,
                                                    timelineidobjeto: @timeline.idobjeto,
                                                    timelinetipoobjeto: @timeline.tipoobjeto)
    elsif tipo=="up"
       Integromat::Webhook.new(:appv3evento).trigger(id: @evento.id,
                                                     idobjeto: @evento.idobjeto,
                                                     tipoobjeto:@evento.tipoobjeto,
                                                     status: @evento.status,
                                                     enviarparaparticipante: @evento.enviarparaparticipante,
                                                     datainicio: @evento.datainicio,
                                                     datafim: @evento.datafim,
                                                     horainicio: @evento.horainicio,
                                                     horafim: @evento.horafim,
                                                     duration: @evento.duration,
                                                     updated_at: @evento.updated_at,
                                                     "tipoacao": "upeventoprogramasetorial",
                                                     idprogramasetorial: @programasetorial.id,
                                                     nomeprogramasetorial: @programasetorial.name,
                                                     anoprogramasetorial: @programasetorial.ano,
                                                     timelineidobjeto: @timeline.idobjeto,
                                                    timelinetipoobjeto: @timeline.tipoobjeto)      
    end  
  end
    
 
end