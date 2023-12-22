class FixCamposUser4 < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :dataprimeirologin, :date
    add_column :users, :primeirologin, :boolean

    
  end
end
