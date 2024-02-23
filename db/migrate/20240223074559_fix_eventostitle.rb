class FixEventostitle < ActiveRecord::Migration[7.0]
  def change
    add_column :eventos, :title, :string
  end
end
