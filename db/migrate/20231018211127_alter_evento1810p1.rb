class AlterEvento1810p1 < ActiveRecord::Migration[7.0]
  def change
    add_column :eventos, :idcalendar, :string
  end
end
