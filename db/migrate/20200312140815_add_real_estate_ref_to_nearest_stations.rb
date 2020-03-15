class AddRealEstateRefToNearestStations < ActiveRecord::Migration[5.2]
  def change
    add_reference :nearest_stations, :real_estate, foreign_key: true
  end
end
