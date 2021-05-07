class CreateCarListings < ActiveRecord::Migration[6.1]
  def change
    create_table :car_listings do |t|
      t.belongs_to :car
      t.belongs_to :dealership

      t.timestamps
    end
  end
end
