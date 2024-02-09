class FixArquivos < ActiveRecord::Migration[7.0]
  def change
    add_column :arquivos, :timelineid, :integer
    add_column :arquivos, :datahoraindice, :datetime
  end
end
