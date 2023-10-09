class Plano < ApplicationRecord
    enum status: { ativo:0, 
    inativo:1 } 

    #after_create :notify_registrationplancr

    #after_update :notify_registrationplanup
  
     
end
