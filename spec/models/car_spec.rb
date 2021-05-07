require 'rails_helper'

RSpec.describe Car, type: :model do
  describe "#current_price" do
    it "reduces the price for every month passed since the released date" do
      release_date = DateTime.current - 2.months

      car = Car.new(release_date: release_date, original_price: 100000)
      expect(car.price).to  eq(96040)
    end

    it "counts the days until the month passes" do
      release_date = DateTime.current - 2.months
      release_date = release_date.change(day: (DateTime.current.day + 1))

      car = Car.new(release_date: release_date, original_price: 100000)
      expect(car.price).to  eq(98000)
    end
  end
end
