class Agenda < ApplicationRecord
    has_one_attached :main_image
    #has_one_attached :main_image, service: :s3
    #has_one_attached :fotomenor

    enum status: { ativo:0, inativo:1 }   
    #enum category: { "Hub de Inovação":0, "Cyber":1 }  
    enum tipoevento: { "Físico":0, "On Line":1}
    #attr_accessor :evento
    attr_accessor :name,
    :descricao,
    :linkevento,
    :datainicio,
    :datafim,
    :horainicio,
    :horafim,
    :duration,
    :enviarparaparticipante 

end
