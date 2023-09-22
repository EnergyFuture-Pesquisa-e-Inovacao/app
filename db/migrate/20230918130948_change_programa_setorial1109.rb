class ChangeProgramaSetorial1109 < ActiveRecord::Migration[7.0]
  def change
    add_column :programasetorials, :quantempresas, :string
    add_column :programasetorials, :quantengajamento, :string
    add_column :programasetorials, :quantincricoes, :string
  end
end
