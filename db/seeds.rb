# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
# wedding = Wedding.create([{info: "test 1"}, {date: "2014-12-01T01:29:18"}, {page_heading: "Zoe and Cameron"}])

User.destroy_all
user = User.create!(first_name: "Rory", last_name: "Jackson", email: "roryjackson9@gmail.com", password: "123456")

9.times do
  wedding = Wedding.new(
    info: Faker::Address.city,
    date: Faker::Date.birthday(min_age: 18, max_age: 65),
    page_heading: Faker::Name.name,
    user: user
  )
  wedding.save!
end
