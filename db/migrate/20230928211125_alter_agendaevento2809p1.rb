class AlterAgendaevento2809p1 < ActiveRecord::Migration[7.0]
  def change
    remove_column :agendas, :descricaocurta
    add_column :eventos, :descricaocurta, :string
  end
end
