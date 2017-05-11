# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
Product.destroy_all #Dangerrousssssss

50.times do 
  Product.create({brand: Faker::Name.name, category: Faker::Food.ingredient, price: Faker::Address.building_number, description: Faker::Lorem.sentence, image: Faker::Avatar.image})
end
