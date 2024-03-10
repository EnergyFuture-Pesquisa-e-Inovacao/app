class Programasetorial < ApplicationRecord
    has_one_attached :main_imagepg
    enum status: { ativo:0, inativo:1,hidden:2 }   
    attr_accessor :datainiciom1,
                  :datafimm1,
                  :horainicio,
                  :horafim,
                  :duration,
                  :category,
                  :enviarparaparticipante

                                        

end


