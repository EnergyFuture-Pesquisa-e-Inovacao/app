class FixIcpUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :icp, foreign_key: true
  end
end
