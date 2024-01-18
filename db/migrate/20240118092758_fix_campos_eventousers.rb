class FixCamposEventousers < ActiveRecord::Migration[7.0]
  def change
    add_column :eventosusers, :tipoobjeto, :integer
  end
end
