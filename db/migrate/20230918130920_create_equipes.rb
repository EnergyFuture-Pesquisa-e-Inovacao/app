class CreateEquipes < ActiveRecord::Migration[7.0]
  def change
    create_table :equipes do |t|
      t.string :name
      t.references :empresa, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
