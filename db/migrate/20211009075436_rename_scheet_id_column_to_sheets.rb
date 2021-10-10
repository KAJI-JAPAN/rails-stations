class RenameScheetIdColumnToSheets < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :scheet_id, :sheet_id
  end
end
