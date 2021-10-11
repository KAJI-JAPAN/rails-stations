class ChangeValidatesColumnToUniqu < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :sheet_id, :bigint, unique: true
  end
end
