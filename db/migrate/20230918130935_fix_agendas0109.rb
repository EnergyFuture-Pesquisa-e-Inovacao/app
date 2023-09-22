class FixAgendas0109 < ActiveRecord::Migration[7.0]
  def change
    remove_column :agendas, :tipoevento
    remove_column :agendas, :duration
    remove_column :agendas, :idevento
    remove_column :agendas, :enviarparaparticipante
    remove_column :agendas, :datainiciom1
    remove_column :agendas, :datainiciom2
    remove_column :agendas, :datafimm1
    remove_column :agendas, :datafimm2
    remove_column :agendas, :horainicio
    remove_column :agendas, :horafim
    remove_column :agendas, :category

  end
end
