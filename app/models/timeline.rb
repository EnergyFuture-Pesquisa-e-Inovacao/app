class Timeline < ApplicationRecord
    enum status: { ativo:0, inativo:1 }   
    #enum category: { "Hub de Inovação":0, "Cyber":1 }  
    #enum tipoobjeto: { "Eventos Agenda":0, "Eventos PG":1,
                       #"Eventos Academy":2,"Arquivos PG":3,
                      # "Arquivos Academy":4,}
    enum tipoobjeto: { "Agenda":0, "Programa Setorial":1, "Academy":2 }                   

end
