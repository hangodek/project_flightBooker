class CreateUserFlights < ActiveRecord::Migration[8.0]
  def change
    create_table :user_flights do |t|
      t.references :user, null: false, foreign_key: true
      t.references :flight, null: false, foreign_key: true

      t.timestamps
    end
  end
end
