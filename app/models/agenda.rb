class Agenda < ApplicationRecord
    has_one_attached :main_image
    enum status: { ativo:0, inativo:1 }    
    enum tipoevento: { "Físico":0, "On Line":1}
    enum tipoparticipanteconvite: { "Free":0, "ICP 1 - Pago":1 , "ICP 2 - Pago":2,
    "Todos":3,"Nenhum":4 }  
    attr_accessor :name,
    :descricao,
    :descricaocurta,
    :linkevento,
    :datainicio,
    :datafim,
    :horainicio,
    :horafim,
    :duration,
    :enviarparaparticipante


    after_create :notify_registrationagendacr

    after_update :notify_registrationagendaup
                
    def notify_registrationagendacr
      Integromat.configure do |cagenda|
       cagenda.web_hooks = { appv3agenda: "seyvmdff1b56zcse9lq81dqvahuloj3d"}
       cagenda.base_uri = "https://hook.us1.make.com/"
      end 
      Integromat::Webhook.new(:appv3agenda).trigger(id: id,
                                                     name: name,
                                                     descricao: descricao,
                                                     descricaocurta: descricaocurta,
                                                     status: status,
                                                     ano: ano,
                                                     empresa: empresa,
                                                     parceiro: parceiro,
                                                     quantempresas: quantempresas,
                                                     quantengajamento: quantengajamento,
                                                     quantinscricoes: quantinscricoes,
                                                     descricaocurta: descricaocurta,
                                                     created_at: created_at,
                                                    "tipoacao": "create")
    end
                
    def notify_registrationagendaup
      Integromat.configure do |cagenda|
       cagenda.web_hooks = { appv3agenda: "seyvmdff1b56zcse9lq81dqvahuloj3d"}
       cagenda.base_uri = "https://hook.us1.make.com/"
      end 
      Integromat::Webhook.new(:appv3agenda).trigger(id: id,
                                                     name: name,
                                                     descricao: descricao,
                                                     descricaocurta: descricaocurta,
                                                     status: status,
                                                     ano: ano,
                                                     empresa: empresa,
                                                     parceiro: parceiro,
                                                     quantempresas: quantempresas,
                                                     quantengajamento: quantengajamento,
                                                     quantinscricoes: quantinscricoes,
                                                     descricaocurta: descricaocurta,
                                                     updated_at: updated_at,
                                                     "tipoacao": "update")
    end    

end
