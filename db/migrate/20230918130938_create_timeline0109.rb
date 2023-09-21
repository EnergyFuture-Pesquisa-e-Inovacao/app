class CreateTimeline0109 < ActiveRecord::Migration[7.0]
  def change
    create_table :timelines do |t|
      t.integer :idobjeto
      t.integer :tipoobjeto
      t.datetime :datahora
      t.integer :status
      t.timestamps
    end
  end
end
