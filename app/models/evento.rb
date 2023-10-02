class Evento < ApplicationRecord
    enum status: { ativo:0, inativo:1 }   
    #enum tipoparticipanteconvite: { "Free":0, "ICP 1 - Pago":1 , "ICP 2 - Pago":2,
                                    #"Todos":3,"Nenhum":4 }  
    enum tipoobjeto: { "Agenda":0, "Programa Setorial":1, "Academy":2 } 


end
