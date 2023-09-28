class AlterProgramaSetorial2809p1 < ActiveRecord::Migration[7.0]
  def change
    remove_column :programasetorials, :fotomaior
    remove_column :programasetorials, :fotomenor
    add_column :programasetorials, :descricaocurta, :string
  end
end
