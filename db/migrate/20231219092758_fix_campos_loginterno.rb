class FixCamposLoginterno < ActiveRecord::Migration[7.0]
  def change
    add_column :loginternos, :permissuser, :integer
    add_column :loginternos, :adminuserid, :bigint
    remove_reference :loginternos, :user

    
  end
end
