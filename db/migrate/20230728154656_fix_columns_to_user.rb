class FixColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :type, :typeuser
  end
end
