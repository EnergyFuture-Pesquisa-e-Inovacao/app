class CreateLoginternos < ActiveRecord::Migration[7.0]
  def change
    create_table :loginternos do |t|
      t.date :data
      t.datetime :hora
      t.time :datahora
      t.string :funcao
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
