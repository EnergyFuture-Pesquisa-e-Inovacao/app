class FixCategoriaAgendas < ActiveRecord::Migration[7.0]
  def change
    add_column :agendas, :categoria, :integer
  end
end
