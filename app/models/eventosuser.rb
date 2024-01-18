class Eventosuser < ApplicationRecord
  belongs_to :user
  belongs_to :evento

  enum tipoobjeto: { "Agenda":0, "Programa Setorial":1, "Academy":2 } 

end
