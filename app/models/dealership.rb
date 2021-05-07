class Dealership < ApplicationRecord
  has_many :car_listings
  has_many :cars, through: :car_listing
end
