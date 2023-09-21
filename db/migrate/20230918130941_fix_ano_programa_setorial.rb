class FixAnoProgramaSetorial < ActiveRecord::Migration[7.0]
  def change
    add_column :programasetorials, :ano, :string 
  end
end
