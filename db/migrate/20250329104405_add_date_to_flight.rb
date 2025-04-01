class AddDateToFlight < ActiveRecord::Migration[8.0]
  def change
    add_column :flights, :date, :datetime
  end
end
