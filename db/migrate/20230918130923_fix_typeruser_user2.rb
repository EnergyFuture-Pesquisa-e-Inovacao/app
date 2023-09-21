class FixTyperuserUser2 < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :newsletter, :boolean
  end
end
