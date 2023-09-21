class FixUsertimeline2 < ActiveRecord::Migration[7.0]
  def change
    remove_reference :users, :timeline, index: true, foreign_key: true
    add_reference :timelines, :user, foreign_key: true
    
  end
end
