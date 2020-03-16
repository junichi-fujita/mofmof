class CreateNearestStations < ActiveRecord::Migration[5.2]
  def change
    create_table :nearest_stations do |t|
      t.string :route_name, null: false
      t.string :station_name, null: false
      t.integer :minutes_on_foot, null: false

      t.timestamps
    end
  end
end
