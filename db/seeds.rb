# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"
# wedding = Wedding.create([{info: "test 1"}, {date: "2014-12-01T01:29:18"}, {page_heading: "Zoe and Cameron"}])
Wedding.destroy_all
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

  file = URI.open("https://images.unsplash.com/photo-1511285560929-80b456fea0bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2938&q=80")
  wedding.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
  wedding.save!
end

Schedule.destroy_all
schedule_1 = Schedule.create!(wedding_id: 1, time: "9am", description: "Some text about whats happening")
schedule_2 = Schedule.create!(wedding_id: 1, time: "12:30pm", description: "Some text about whats happening")
schedule_3 = Schedule.create!(wedding_id: 1, time: "12pm", description: "Some text about whats happening")
schedule_4 = Schedule.create!(wedding_id: 1, time: "7pm", description: "Some text about whats happening")
