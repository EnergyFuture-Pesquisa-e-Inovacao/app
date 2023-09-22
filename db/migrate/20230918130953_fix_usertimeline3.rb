class FixUsertimeline3 < ActiveRecord::Migration[7.0]
  def change
    remove_reference :timelines, :user, foreign_key: true
    add_reference :timelines, :user, foreign_key: false
  end
end
