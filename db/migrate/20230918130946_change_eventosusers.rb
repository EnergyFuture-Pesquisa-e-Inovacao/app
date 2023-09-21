class ChangeEventosusers < ActiveRecord::Migration[7.0]
  def change
    add_column :eventosusers, :tipoobjeto, :integer
    add_column :eventosusers, :idobjeto, :integer
  end
end
