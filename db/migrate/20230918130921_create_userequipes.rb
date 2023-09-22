class CreateUserequipes < ActiveRecord::Migration[7.0]
  def change
    create_table :userequipes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :empresa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
