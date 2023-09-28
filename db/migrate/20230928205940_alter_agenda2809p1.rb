class AlterAgenda2809p1 < ActiveRecord::Migration[7.0]
  def change
    remove_column :agendas, :fotomaior
    remove_column :agendas, :fotomenor
    add_column :agendas, :descricaocurta, :string
  end
end
