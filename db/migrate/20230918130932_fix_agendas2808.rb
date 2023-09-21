class FixAgendas2808 < ActiveRecord::Migration[7.0]
  def change
    add_column :agendas, :idevento, :integer
    add_column :agendas, :enviarparaparticipante, :boolean
    add_column :agendas, :datainiciom1, :date
    add_column :agendas, :datainiciom2, :date
    add_column :agendas, :datafimm1, :date
    add_column :agendas, :datafimm2, :date
    add_column :agendas, :horainicio, :time
    add_column :agendas, :horafim, :time
    add_column :agendas, :duration, :time
    remove_column :agendas, :dataevento 
    remove_column :agendas, :horaevento
  end
end
