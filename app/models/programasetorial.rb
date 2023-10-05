class Programasetorial < ApplicationRecord
    has_one_attached :main_imagepg
    enum status: { ativo:0, inativo:1 }   
    attr_accessor :datainiciom1,
                  :datafimm1,
                  :horainicio,
                  :horafim,
                  :duration,
                  :category,
                  :enviarparaparticipante


    after_create :notify_registrationprogsetcr

    after_update :notify_registrationprogsetup
                
    def notify_registrationprogsetcr
      Integromat.configure do |cprogset|
       cprogset.web_hooks = { appv3programasetorial: "sj3td7a4iact5qfe9oy2edc5nv49s4lw"}
       cprogset.base_uri = "https://hook.us1.make.com/"
      end 
      Integromat::Webhook.new(:appv3programasetorial).trigger(id: id,
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
                
    def notify_registrationprogsetup
      Integromat.configure do |cprogset|
       cprogset.web_hooks = { appv3programasetorial: "sj3td7a4iact5qfe9oy2edc5nv49s4lw"}
       cprogset.base_uri = "https://hook.us1.make.com/"
      end 
      Integromat::Webhook.new(:appv3programasetorial).trigger(id: id,
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


