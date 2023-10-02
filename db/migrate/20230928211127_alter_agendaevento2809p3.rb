class AlterAgendaevento2809p3 < ActiveRecord::Migration[7.0]
  def change
    add_column :agendas, :tipoparticipanteconvite, :integer
  end
end
