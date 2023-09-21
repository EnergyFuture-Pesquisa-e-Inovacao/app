class FixEmpresaNomefantasia < ActiveRecord::Migration[7.0]
  def change
    add_column :empresas, :razaosocial, :string
    add_column :empresas, :cnpj, :string
    remove_column :empresas, :name
    add_column :empresas, :nomefantasia, :string
    add_column :empresas, :category, :integer
    add_column :agendas, :category, :integer
  end
end
