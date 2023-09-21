class FixAlterTableTimeline0109 < ActiveRecord::Migration[7.0]
  def change
    remove_column :eventos, :idtimeline
  end
end
