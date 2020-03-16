class NearestStation < ApplicationRecord
  belongs_to :real_estate

  validates :route_name, presence: false
  validates :station_name, presence: false
  validates :minutes_on_foot, presence: false
end
