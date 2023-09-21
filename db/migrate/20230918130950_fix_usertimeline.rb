class FixUsertimeline < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :timeline, foreign_key: true
  end
end
