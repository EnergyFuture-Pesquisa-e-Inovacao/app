class FixCamposUser5 < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :countlogin, :integer
    add_column :users, :ultimologin, :date

    
  end
end
