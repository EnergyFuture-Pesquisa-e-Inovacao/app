class Arquivo < ApplicationRecord
    enum status: { "ativo":0, "inativo":1 }   
    enum tipoobjeto: { "Agenda":0, "Programa Setorial":1, "Academy":2 } 

    has_many_attached :images
    attr_reader :new_images#para atribuir novas imagens sem apagar as outras
  
    def new_images=(images)
      self.images.attach(images)#para atribuir novas imagens sem apagar as outras
    end

end
