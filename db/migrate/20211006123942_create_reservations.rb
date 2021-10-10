class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :schedule, foregin_key: true
      t.references :scheet, foregin_key: true

      t.date :date, null: false
      t.string :email, null: false
      t.string :string, limit: 50

      t.timestamps
    end
  end
end
