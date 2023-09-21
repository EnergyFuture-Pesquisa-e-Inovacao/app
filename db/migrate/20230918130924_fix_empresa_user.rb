class FixEmpresaUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :empresa, foreign_key: true
  end
end
