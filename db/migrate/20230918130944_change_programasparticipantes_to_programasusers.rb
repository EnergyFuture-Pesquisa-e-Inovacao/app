class ChangeProgramasparticipantesToProgramasusers < ActiveRecord::Migration[7.0]
  def change
    rename_table :programasparticipantes, :programasusers
  end
end
