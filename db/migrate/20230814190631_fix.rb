class Fix < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :plano, foreign_key: true
  end
end
