class Programasuser < ApplicationRecord
  #belongs_to :user
  has_many :users
  belongs_to :programasetorial
  #has_many :programasetorials, dependent: :destroy
end
