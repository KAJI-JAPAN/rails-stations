class CreateSamples < ActiveRecord::Migration[6.1]
  def change
    create_table :samples do |t|
      t.string :name
      t.integer :year
      t.string :description
      t.string :image_url
      t.integer :is_showing

      t.timestamps
    end
  end
end
