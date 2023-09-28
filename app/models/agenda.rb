class Agenda < ApplicationRecord
    has_one_attached :main_image
    #has_one_attached :menor_image
    #has_one_attached :photo

   # has_one_attached :main_image do |main_image|
    #    main_image.variant :thumb, resize_to_limit: [100, 100]
    #    main_image.variant :medium, resize_to_limit: [400, 400]
    #end

    #has_one_attached :main_image do |attachable|
    #    attachable.variant :thumb, resize: "100x100"
   #     attachable.variant :medium, resize: "300x300"
        #monochrome: true
   # end

    enum status: { ativo:0, inativo:1 }   
    #enum category: { "Hub de Inovação":0, "Cyber":1 }  
    enum tipoevento: { "Físico":0, "On Line":1}
    #attr_accessor :evento
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
