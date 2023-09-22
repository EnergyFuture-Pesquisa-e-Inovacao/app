class CreateArquivos < ActiveRecord::Migration[7.0]
  def change
    create_table :arquivos do |t|
      
      t.integer :idobjeto
      t.integer :tipoobjeto
      t.integer :status
      t.string :name
      t.string :url
      t.integer :tipoarquivo

      t.timestamps
    end
  end
end
