class Evento < ApplicationRecord
    enum status: { ativo:0, inativo:1 }   
    #enum category: { "Hub de Inovação":0, "Cyber":1 }  
    enum tipoobjeto: { "Agenda":0, "Programa Setorial":1, "Academy":2 } 

end
