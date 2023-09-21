class CreatetableProgramasparticipantes2808 < ActiveRecord::Migration[7.0]
  def change
    create_table :programasparticipantes do |t|
      t.references :programasetorial, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
