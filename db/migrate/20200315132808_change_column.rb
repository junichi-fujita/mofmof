class ChangeColumn < ActiveRecord::Migration[5.2]
  def up
    change_column :nearest_stations, :route_name, :string, null: true
    change_column :nearest_stations, :station_name, :string, null: true
    change_column :nearest_stations, :minutes_on_foot, :integer, null: true
    change_column :nearest_stations, :created_at, :date_time, null: true
    change_column :nearest_stations, :updated_at, :date_time, null: true
  end
  def down
    change_column :nearest_stations, :route_name, :string, null: false
    change_column :nearest_stations, :station_name, :string, null: false
    change_column :nearest_stations, :minutes_on_foot, :integer, null: false
    change_column :nearest_stations, :created_at, :date_time, null: false
    change_column :nearest_stations, :updated_at, :date_time, null: false
  end
end
