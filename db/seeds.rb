# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "admin@example.com", password: "adminadmin", password_confirmation: "adminadmin", role: "admin")

dealership = Dealership.create(name: "San Andreas Cars", location: "50th St. Los Santos")
dealership_two = Dealership.create(name: "Freedom Cars", location: "Liberty City")

kuruma = Car.create(name: "Kuruma", release_date: 1.year.ago, original_price: 1000000)
kuruma.car_listings.create(dealership: dealership)
kuruma.car_listings.create(dealership: dealership_two)

Car.create(name: "Coquette", release_date: 4.months.ago, original_price: 800000).car_listings.create(dealership: dealership)
