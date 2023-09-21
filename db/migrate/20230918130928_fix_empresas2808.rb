class FixEmpresas2808 < ActiveRecord::Migration[7.0]
  def change
    remove_column :empresas, :category
  end
end
