class RealEstate < ApplicationRecord
  has_many :nearest_stations, dependent: :destroy
  accepts_nested_attributes_for :nearest_stations,
    reject_if: lambda { |attributes| attributes['route_name'].blank? }
end
