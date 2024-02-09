class FixEventos < ActiveRecord::Migration[7.0]
  def change
    add_column :eventos, :timelineid, :integer
    add_column :eventos, :datahoraindice, :datetime
  end
end
