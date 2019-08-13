# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts "cleaning DB"

#Animal.destroy.all



user = User.new(
  name: Faker::Name.unique.name,
  address: Faker::Address.full_address,
  email: Faker::Internet.email,
  password: "password",
  phone_number: Faker::PhoneNumber.cell_phone
  )
user.save!

10.times do
animals = Animal.new(
  name: Faker::Creature::Cat.unique.name,
  description:"Do you see any Teletubbies in here? Do you see a slender plastic tag clipped to my shirt with my name printed on it? Do you see a little Asian child with a blank expression on his face sitting outside on a mechanical helicopter that shakes when you put quarters in it? No? Well, that's what you see at a toy store. And you must think you're in a toy store, because you're here shopping for an infant named Jeb.",
  race: Faker::Creature::Animal.unique.name,
  user: user
  )
animals.save!
end
