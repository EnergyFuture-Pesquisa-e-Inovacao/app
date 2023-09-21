class Arquivo < ApplicationRecord
    enum status: { ativo:0, inativo:1 }    
    enum tipoobjeto: { "Agenda":0, "Programa Setorial":1, "Academy":2 } 

end
