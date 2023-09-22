class FixEventos0109 < ActiveRecord::Migration[7.0]
def change
  create_table :eventos do |t|
    t.integer :idobjeto
    t.integer :tipoobjeto
    t.integer :status
    t.boolean :enviarparaparticipante
    t.date :datainicio
    t.date :datafim
    t.time :horainicio
    t.time :horafim
    t.time :duration
    t.timestamps
  end
end
end
