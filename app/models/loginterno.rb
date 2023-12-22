class Loginterno < ApplicationRecord
  


  def self.ransortable_attributes(auth_object = nil)
    column_names - ["password_digest"]
   end
      
        # Allowlist the User model attributes for search, except +password_digest+,
        # as above. The +full_name+ ransacker below is included via +_ransackers.keys+
        #
  def self.ransackable_attributes(auth_object = nil)
    ransortable_attributes + _ransackers.keys
  end
  
end
