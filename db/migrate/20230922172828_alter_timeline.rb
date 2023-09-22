class AlterTimeline < ActiveRecord::Migration[7.0]
  def change
    remove_reference :timelines, :user
    remove_column :timelines, :datahora
  end
end
