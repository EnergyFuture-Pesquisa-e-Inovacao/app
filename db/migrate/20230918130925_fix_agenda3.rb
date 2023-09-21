class FixAgenda3 < ActiveRecord::Migration[7.0]
  def change
    remove_column :agendas, :categoria
  end
end
