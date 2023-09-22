class Timeline < ApplicationRecord
    has_many :users
    enum status: { ativo:0, inativo:1 }   
    #enum category: { "Hub de Inovação":0, "Cyber":1 }  
    enum tipoobjeto: { "Eventos Agenda":0, "Eventos PG":1,
                       "Eventos Academy":2,"Arquivos PG":3,
                       "Arquivos Academy":4,}

end
