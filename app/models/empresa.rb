class Empresa < ApplicationRecord
  belongs_to :plano
  enum status: { ativo:0, 
  inativo:1 }

  #after_create :notify_registrationempcr

  #after_update :notify_registrationempup


 
end
