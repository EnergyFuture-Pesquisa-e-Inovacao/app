class CreatetableEventosparticipantes2808 < ActiveRecord::Migration[7.0]
  def change
    create_table :eventosparticipantes do |t|
      t.references :agenda, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :idevento
      t.boolean :foienviado
      
      t.timestamps
    end
  end
end
