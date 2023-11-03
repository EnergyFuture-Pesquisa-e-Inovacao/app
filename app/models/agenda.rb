class Agenda < ApplicationRecord
    has_one_attached :main_image
    enum status: { ativo:0, inativo:1 }    
    enum tipoevento: { "Energy Future":0, "Ecossistema":1}
    enum tipoparticipanteconvite: { "ICP 1 - Pago":1 , "ICP 2 - Pago":2,"ICP 3":3,
    "Todos":4,"Nenhum":5 }  
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
                
  

end
