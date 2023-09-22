class ChangeEventosparticipantesToEventosusers < ActiveRecord::Migration[7.0]
  def change
    drop_table :eventosparticipantes

    create_table :eventosusers do |t|
      t.references :evento, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :idevento
      t.boolean :foienviado
      
      t.timestamps
    end
  end
end
