class Car < ApplicationRecord
  has_many :car_listings
  has_many :dealerships, through: :car_listings
  has_one_attached :photo, dependent: :destroy
  
  enum condition: HashWithIndifferentAccess.new(brand_new: "brand_new", used: "used")

  def current_price
    price = original_price
    months_passed = get_months_since_release

    months_passed.times do
      price = price * 0.98
    end

    price
  end

  def price
    current_price.round(2)
  end

  private
  
  def get_months_since_release
    today = DateTime.current
    months_since_release = (today.year * 12 + today.month) - (release_date.year * 12 + release_date.month)

    if today.day < release_date.day
      months_since_release = months_since_release - 1
    end

    months_since_release
  end
end
