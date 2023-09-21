class FixHoraeventoAgendas < ActiveRecord::Migration[7.0]
  def change
    add_column :agendas, :horaevento, :datetime
  end
end
