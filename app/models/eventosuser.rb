class Eventosuser < ApplicationRecord
  belongs_to :user
  belongs_to :evento

end
