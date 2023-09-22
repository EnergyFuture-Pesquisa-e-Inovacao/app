class Academiesparticipante < ApplicationRecord
  belongs_to :user
  belongs_to :academy
end
