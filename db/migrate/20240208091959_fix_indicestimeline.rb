class FixIndicestimeline < ActiveRecord::Migration[7.0]
  def change
    add_column :timelines, :indiceobjetos, :integer
    add_column :eventos, :indicetm, :integer
    add_column :arquivos, :indicetm, :integer
    add_column :textos, :indicetm, :integer
  end
end
