# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Generating Users"

User.create(name:Faker::Name.name, email:"test@email.xyz", location:Faker::Address.city, password: "test123")
User.create(name:Faker::Name.name, email:"asd@asd.com", location:Faker::Address.city, password: "asdasd")

puts "Generating Listings"

Listing.create(name:"Raspberry Pi", model:"4B", price:59.99, software: "Ubuntu", description: "New", sold:false)

10.times do
    Listing.create(name:"Raspberry pi", model:"4B", price:59.99, software:"Raspbian", description:Faker::Lorem.sentence, user_id:(rand(2)+1),sold:false)
end

puts "Database seeding complete"