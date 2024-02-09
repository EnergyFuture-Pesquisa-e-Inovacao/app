class FixIndiceagenda < ActiveRecord::Migration[7.0]
  def change
    add_column :agendas, :indicetm, :integer
  end
end
