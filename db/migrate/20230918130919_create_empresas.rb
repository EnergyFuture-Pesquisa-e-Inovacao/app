class CreateEmpresas < ActiveRecord::Migration[7.0]
  def change
    create_table :empresas do |t|
      t.string :name
      t.references :plano, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
