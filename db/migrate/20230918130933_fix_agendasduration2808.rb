class FixAgendasduration2808 < ActiveRecord::Migration[7.0]
  def change
    remove_column :agendas, :duration
    add_column :agendas, :duration, :string     
  end
end
