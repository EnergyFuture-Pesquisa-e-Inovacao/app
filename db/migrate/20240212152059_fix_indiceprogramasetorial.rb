class FixIndiceprogramasetorial < ActiveRecord::Migration[7.0]
  def change
    add_column :programasetorials, :indicetm, :integer
  end
end
