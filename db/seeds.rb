# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

20.times do 
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.free_email,
    nickname: "@#{Faker::Name.first_name}",
    password: '123456',
    phone: Faker::PhoneNumber.phone_number,
    introduce: Faker::Hacker.say_something_smart,
    isAdmin: false
  )
end