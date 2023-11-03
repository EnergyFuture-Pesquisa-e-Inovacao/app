class Agenda < ApplicationRecord
    has_one_attached :main_image
    enum status: { ativo:0, inativo:1 }    
    enum tipoevento: { "Energy Future":0, "Ecossistema":1}
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
                
  

end
