class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :type, :integer
  end
end
