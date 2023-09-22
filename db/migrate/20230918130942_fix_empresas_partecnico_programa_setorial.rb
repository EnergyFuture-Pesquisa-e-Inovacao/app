class FixEmpresasPartecnicoProgramaSetorial < ActiveRecord::Migration[7.0]
  def change
    add_column :programasetorials, :empresa, :string 
    add_column :programasetorials, :parceiro, :string 
  end
end
