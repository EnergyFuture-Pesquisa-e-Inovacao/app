class Empresa < ApplicationRecord
  belongs_to :plano
  enum status: { ativo:0, 
  inativo:1 }
 
end
