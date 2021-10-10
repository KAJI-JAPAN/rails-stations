class RenameStringColumnToName < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :string, :name
  end
end
