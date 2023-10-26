class CreateEventosusers < ActiveRecord::Migration[7.0]
  def change
    create_table :eventosusers do |t|
      
      t.integer :user_id
      t.integer :evento_id
      t.string :idcalendaruser

      t.timestamps
    end
  end
end
