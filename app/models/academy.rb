class Academy < ApplicationRecord
    enum status: { ativo:0, inativo:1 }

    attr_accessor :datainiciom1,
    :datafimm1,
    :horainicio,
    :horafim,
    :duration,
    :status,
    :category,
    :enviarparaparticipante
end
