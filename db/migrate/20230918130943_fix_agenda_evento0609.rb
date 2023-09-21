class FixAgendaEvento0609 < ActiveRecord::Migration[7.0]
  def change
    remove_column :agendas, :name
    remove_column :agendas, :descricao
    add_column :eventos, :name, :string
    add_column :eventos, :descricao, :string
    add_column :eventos, :linkevento, :string
  end
end
