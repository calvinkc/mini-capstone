# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
Product.destroy_all 

10.times do 
  Product.create(
    {brand: Faker::Name.name,
     price: Faker::Address.building_number,
     description: Faker::Lorem.sentence,
     supplier_id: rand(1..5)
     })
end

5.times do
  Supplier.create(
  {name: Faker::Name.name,
   email: Faker::Internet.email,
   phone: Faker::PhoneNumber.cell_phone}
  )
end

50.times do
  Image.create(
  {url: Faker::Avatar.image,
   product_id: rand(1..10)
   })
end



