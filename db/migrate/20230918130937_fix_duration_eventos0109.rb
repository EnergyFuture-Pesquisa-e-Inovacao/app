class FixDurationEventos0109 < ActiveRecord::Migration[7.0]
  def change
    remove_column :eventos, :duration
    add_column :eventos, :duration, :string      
  end
end
