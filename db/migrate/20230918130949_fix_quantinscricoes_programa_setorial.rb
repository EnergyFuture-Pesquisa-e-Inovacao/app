class FixQuantinscricoesProgramaSetorial < ActiveRecord::Migration[7.0]
  def change
    remove_column :programasetorials, :quantincricoes
    add_column :programasetorials, :quantinscricoes, :string
  end
end
