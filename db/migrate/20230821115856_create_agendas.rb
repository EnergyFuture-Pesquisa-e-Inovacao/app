class CreateAgendas < ActiveRecord::Migration[7.0]
  def change
    create_table :agendas do |t|
      t.string :name
      t.string :descricao
      t.string :fotomaior
      t.string :fotomenor
      t.date :dataevento
      t.integer :status

      t.timestamps
    end
  end
end
