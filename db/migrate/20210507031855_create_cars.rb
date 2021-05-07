class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.datetime :release_date
      t.decimal :original_price
      t.string :condition

      t.timestamps
    end
  end
end
