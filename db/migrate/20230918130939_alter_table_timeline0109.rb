class AlterTableTimeline0109 < ActiveRecord::Migration[7.0]
  def change
    add_column :eventos, :idtimeline, :integer  
  end
end
