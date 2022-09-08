# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Schedule.destroy_all

schedule_1 = Schedule.create!(wedding_id: 1, time: "9am", description: "Some text about whats happening")
schedule_2 = Schedule.create!(wedding_id: 1, time: "12:30pm", description: "Some text about whats happening")
schedule_3 = Schedule.create!(wedding_id: 1, time: "12pm", description: "Some text about whats happening")
schedule_4 = Schedule.create!(wedding_id: 1, time: "7pm", description: "Some text about whats happening")