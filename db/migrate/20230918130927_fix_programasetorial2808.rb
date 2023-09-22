class FixProgramasetorial2808 < ActiveRecord::Migration[7.0]
  def change
    remove_column :programasetorials, :dataevento
    remove_column :programasetorials, :category
  end
end
