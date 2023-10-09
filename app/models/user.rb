class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  
  #belongs_to :empresa

  enum status: { ativo:0, 
                inativo:1 }

  #belongs_to :icp     
  #belongs_to :plano 

    validates :email, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    #validate :cpf_valid?
  
    def cpf_valid?
      return if CPF.valid?(cpf)
  
      errors.add(:cpf)
    end
  end
