class CreateTextos < ActiveRecord::Migration[7.0]
  def change
    create_table :textos do |t|
      
      t.string  :title
      t.string  :conteudo
      t.integer :status
      t.integer :idobjeto
      t.integer :tipoobjeto
      t.integer :timelineid
      t.datetime :datahoraindice

      t.timestamps
    end
  end
end
