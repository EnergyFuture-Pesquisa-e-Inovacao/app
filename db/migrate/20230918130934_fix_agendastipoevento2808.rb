class FixAgendastipoevento2808 < ActiveRecord::Migration[7.0]
  def change
    add_column :agendas, :tipoevento, :integer  
  end
end
