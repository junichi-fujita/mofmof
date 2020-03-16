class RealEstate < ApplicationRecord
  has_many :nearest_stations, dependent: :destroy
  accepts_nested_attributes_for :nearest_stations,
    reject_if: lambda { |attributes| attributes['route_name'].blank? }

  validates :real_estate_name, presence: true
  validates :rent, presence: true
  validates :address, presence: true
  validates :age, presence: true
  validates :remarks, presence: true
end