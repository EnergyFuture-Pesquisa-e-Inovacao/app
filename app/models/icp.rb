class Icp < ApplicationRecord
    enum status: { ativo:0, 
    inativo:1 }  
    
    #after_create :notify_registrationicpcr

    #after_update :notify_registrationicpup
  
    

end
