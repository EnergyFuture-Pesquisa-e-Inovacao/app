class AlterAgendaevento2809p2 < ActiveRecord::Migration[7.0]
  def change
    add_column :eventos, :tipoparticipanteconvite, :integer
  end
end
