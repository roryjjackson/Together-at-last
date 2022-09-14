# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Eamples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require "faker"

puts "destroying everything!"


WeddingGuest.destroy_all
RegistryItem.destroy_all
Registry.destroy_all
AccomodationInfo.destroy_all
Schedule.destroy_all
Vip.destroy_all
Wedding.destroy_all
User.destroy_all

puts "everything destroyed!"

puts "creating 3 users"
user1 = User.create(email:"test1@test.com", password: "123456", first_name: "Mustak", last_name:"hi", host: true )
user2 = User.create(email:"test2@test.com", password: "123456", first_name: "Rory", last_name:"hi", host: false )
user3 = User.create(email:"test3@test.com", password: "123456", first_name: "Rory", last_name:"hi", host: false )

puts "user created #{User.count} users"

puts "creating 3 weddings"

wedding_1 = Wedding.new(user_id: user1.id, page_heading: "Mustak and Sharon", info: "If we had it our way, all of us would be on a pontoon gambling boat this weekend with Dark and Stormy's in hand, setting sail for 80 degree weather. Since our parents have been patiently waiting for a ceremony though, we decided June nuptials in the city would suffice. There are plenty of wish lanterns to be lit and bottles of champagne waiting to be popped all we need are your lovely faces.", date: Date.today.strftime("%FT%T"))
file = URI.open("https://res.cloudinary.com/dzyug4vno/image/upload/v1663071844/development/DSC02485_g4xrxf.jpg")
wedding_1.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
wedding_1.save!

wedding_2 = Wedding.new(user_id: user2.id, page_heading: "Rory and James", info: "If we had it our way, all of us would be on a pontoon gambling boat this weekend with Dark and Stormy's in hand, setting sail for 80 degree weather. Since our parents have been patiently waiting for a ceremony though, we decided June nuptials in the city would suffice. There are plenty of wish lanterns to be lit and bottles of champagne waiting to be popped all we need are your lovely faces.", date: Date.today.strftime("%FT%T"))
file = URI.open("https://images.pexels.com/photos/1024993/pexels-photo-1024993.jpeg?cs=srgb&dl=pexels-asad-photo-maldives-1024993.jpg&fm=jpg")
wedding_2.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
wedding_2.save!

wedding_3 = Wedding.new(user_id: user3.id, page_heading: "Mr and Mrs Jackson", info: "If we had it our way, all of us would be on a pontoon gambling boat this weekend with Dark and Stormy's in hand, setting sail for 80 degree weather. Since our parents have been patiently waiting for a ceremony though, we decided June nuptials in the city would suffice. There are plenty of wish lanterns to be lit and bottles of champagne waiting to be popped all we need are your lovely faces.", date: Date.today.strftime("%FT%T"))
file = URI.open("https://images.pexels.com/photos/1573007/pexels-photo-1573007.jpeg?cs=srgb&dl=pexels-taras-budniak-1573007.jpg&fm=jpg")
wedding_3.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
wedding_3.save!

puts "user created #{Wedding.count} weddings"

puts "creating 4 accomodations"
accomodation1 = AccomodationInfo.create(title: "Ritz Paris - Stay with us", description: "The Ritz Paris has reopened in June 2016 after an unprecedented restoration. The legendary hotel opens its doors with 71 luxurious suites, including 16 historic Prestige Suites, and 71 rooms. ", address: "15 Place Vendome, 75001 Paris France", wedding: wedding_1)
accomodation2 = AccomodationInfo.create(title: "Kimpton St Honore Paris", description: "Moments away from the Opera House, the iconic department stores, the Faubourg St Honoré and the Tuileries Garden, Kimpton St Honoré Paris features 149 beautifully appointed guestrooms and suites.", address: "27-29 boulevard des Capucines, 75002 Paris France", wedding: wedding_1)
accomodation3 = AccomodationInfo.create(title: "Hyatt Regency Paris", description: "Hyatt Regency Paris Etoile, formerly the renowned Hotel Concorde La Fayette, stands as one of the most impressive properties in the city.", address: "22 rue Danielle Casanova, 75002 Paris France", wedding: wedding_1)
accomodation4 = AccomodationInfo.create(title: "The Westin Paris", description: "4-star hotel with 24-hour fitness and swimming pool, near the city center.", address: "3, Rue De Castiglione, 75001 Paris France", wedding: wedding_1)

puts "user created #{AccomodationInfo.count} accomdations"

vip_1 = Vip.create!(wedding_id: wedding_1.id, name: "Mustak", description: "First person to hit the reception dance floor after the couple: “Me. But Chase is notorious for that, too. I foresee and real dirty dance-off.", category: "Best man")

puts"wedding created #{Wedding.count}"

vip_1 = Vip.new(wedding_id: wedding_2.id, name: "Mustak", description: "First person to hit the reception dance floor after the couple: “Me. But Chase is notorious for that, too. I foresee and real dirty dance-off.", category: "Groomsman")
pic = URI.open("https://images.pexels.com/photos/845457/pexels-photo-845457.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-845457.jpg&fm=jpg")
vip_1.photo.attach(io: pic, filename: "nes.png", content_type: "image/png")
vip_1.save!
vip_2 = Vip.create!(wedding_id: wedding_2.id, name: "Rory", description: "Must-have survival supply: “A Leatherman. And a flask of Heaven Hill whiskey, for those chilly nights camping you never know when you'll get unexpected company.”", category: "Groomsman")
vip_3 = Vip.create!(wedding_id: wedding_2.id, name: "Sharon", description: "Best book to bring on vacation: “Tiny Beautiful Things by Cheryl Strayed. It's smart and witty and fun. Since the book is a collection of advice-column letters, you can flip open and read a couple at a time, which is nice for a bus ride or before a nap by the ocean.", category: "Bridesmaid")
vip_4 = Vip.create!(wedding_id: wedding_2.id, name: "Tony", description: "You're at karaoke, what is your go-to crowd pleaser? “The last time I hit the mic, maybe two years ago, it was my buddy's bachelor party weekend. I did that Les Mis song 'On My Own'. Don't judge. It was after numerous Sake bombs, and, for the record, it brought down the house", category: "Groomsman" )
vip_5 = Vip.create!(wedding_id: wedding_2.id, name: "Michael", description: "You're at karaoke, what is your go-to crowd pleaser? “The last time I hit the mic, maybe two years ago, it was my buddy's bachelor party weekend. I did that Les Mis song 'On My Own'. Don't judge. It was after numerous Sake bombs, and, for the record, it brought down the house", category: "Groomsman" )
vip_6 = Vip.create!(wedding_id: wedding_2.id, name: "Louise", description: "You're at karaoke, what is your go-to crowd pleaser? “The last time I hit the mic, maybe two years ago, it was my buddy's bachelor party weekend. I did that Les Mis song 'On My Own'. Don't judge. It was after numerous Sake bombs, and, for the record, it brought down the house", category: "Bridesmaid" )
vip_7 = Vip.create!(wedding_id: wedding_2.id, name: "Jerry", description: "You're at karaoke, what is your go-to crowd pleaser? “The last time I hit the mic, maybe two years ago, it was my buddy's bachelor party weekend. I did that Les Mis song 'On My Own'. Don't judge. It was after numerous Sake bombs, and, for the record, it brought down the house", category: "Groomsman" )
vip_8 = Vip.create!(wedding_id: wedding_2.id, name: "Shaleen", description: "You're at karaoke, what is your go-to crowd pleaser? “The last time I hit the mic, maybe two years ago, it was my buddy's bachelor party weekend. I did that Les Mis song 'On My Own'. Don't judge. It was after numerous Sake bombs, and, for the record, it brought down the house", category: "Bridesmaid" )
vip_9 = Vip.create!(wedding_id: wedding_2.id, name: "Emma", description: "You're at karaoke, what is your go-to crowd pleaser? “The last time I hit the mic, maybe two years ago, it was my buddy's bachelor party weekend. I did that Les Mis song 'On My Own'. Don't judge. It was after numerous Sake bombs, and, for the record, it brought down the house", category: "Bridesmaid" )
vip_10 = Vip.create!(wedding_id: wedding_2.id, name: "Sally", description: "You're at karaoke, what is your go-to crowd pleaser? “The last time I hit the mic, maybe two years ago, it was my buddy's bachelor party weekend. I did that Les Mis song 'On My Own'. Don't judge. It was after numerous Sake bombs, and, for the record, it brought down the house", category: "Bridesmaid" )
vip_11 = Vip.create!(wedding_id: wedding_2.id, name: "Saki and Margaret", description: "You're at karaoke, what is your go-to crowd pleaser? “The last time I hit the mic, maybe two years ago, it was my buddy's bachelor party weekend. I did that Les Mis song 'On My Own'. Don't judge. It was after numerous Sake bombs, and, for the record, it brought down the house", category: "Parent of the groom" )
vip_12 = Vip.create!(wedding_id: wedding_2.id, name: "Charlie and Janet", description: "You're at karaoke, what is your go-to crowd pleaser? “The last time I hit the mic, maybe two years ago, it was my buddy's bachelor party weekend. I did that Les Mis song 'On My Own'. Don't judge. It was after numerous Sake bombs, and, for the record, it brought down the house", category: "Parent of the bride" )

puts"vip created #{Vip.count}"

schedule_1 = Schedule.create!(wedding_id: wedding_1.id, time: "9am", description: "Although the courthouse will have our signatures on the dotted line, we know it won't be real in our eyes until you help us make the commitment. After some lip-locking, a Pablo Neruda poem and the string-quartet version of our all-time favorite jam (shhh it's a secret), we think the deal will be sealed.")
schedule_2 = Schedule.create!(wedding_id: wedding_1.id, time: "12:30pm", description: "Although the courthouse will have our signatures on the dotted line, we know it won't be real in our eyes until you help us make the commitment. After some lip-locking, a Pablo Neruda poem and the string-quartet version of our all-time favorite jam (shhh it's a secret), we think the deal will be sealed")
schedule_3 = Schedule.create!(wedding_id: wedding_1.id, time: "12pm", description: "Although the courthouse will have our signatures on the dotted line, we know it won't be real in our eyes until you help us make the commitment. After some lip-locking, a Pablo Neruda poem and the string-quartet version of our all-time favorite jam (shhh it's a secret), we think the deal will be sealed")
schedule_4 = Schedule.create!(wedding_id: wedding_1.id, time: "7pm", description: "Although the courthouse will have our signatures on the dotted line, we know it won't be real in our eyes until you help us make the commitment. After some lip-locking, a Pablo Neruda poem and the string-quartet version of our all-time favorite jam (shhh it's a secret), we think the deal will be sealed")
schedule_5 = Schedule.create!(wedding_id: wedding_2.id, time: "9am", description: "Although the courthouse will have our signatures on the dotted line, we know it won't be real in our eyes until you help us make the commitment. After some lip-locking, a Pablo Neruda poem and the string-quartet version of our all-time favorite jam (shhh it's a secret), we think the deal will be sealed.")
schedule_6 = Schedule.create!(wedding_id: wedding_2.id, time: "12:30pm", description: "Although the courthouse will have our signatures on the dotted line, we know it won't be real in our eyes until you help us make the commitment. After some lip-locking, a Pablo Neruda poem and the string-quartet version of our all-time favorite jam (shhh it's a secret), we think the deal will be sealed.Some text about whats happening")
schedule_7 = Schedule.create!(wedding_id: wedding_2.id, time: "12pm", description: "Although the courthouse will have our signatures on the dotted line, we know it won't be real in our eyes until you help us make the commitment. After some lip-locking, a Pablo Neruda poem and the string-quartet version of our all-time favorite jam (shhh it's a secret), we think the deal will be sealed.")
schedule_8 = Schedule.create!(wedding_id: wedding_2.id, time: "7pm", description: "Although the courthouse will have our signatures on the dotted line, we know it won't be real in our eyes until you help us make the commitment. After some lip-locking, a Pablo Neruda poem and the string-quartet version of our all-time favorite jam (shhh it's a secret), we think the deal will be sealed.")
schedule_9 = Schedule.create!(wedding_id: wedding_3.id, time: "9am", description: "Although the courthouse will have our signatures on the dotted line, we know it won't be real in our eyes until you help us make the commitment. After some lip-locking, a Pablo Neruda poem and the string-quartet version of our all-time favorite jam (shhh it's a secret), we think the deal will be sealed.")
schedule_10 = Schedule.create!(wedding_id: wedding_3.id, time: "12:30pm", description: "Although the courthouse will have our signatures on the dotted line, we know it won't be real in our eyes until you help us make the commitment. After some lip-locking, a Pablo Neruda poem and the string-quartet version of our all-time favorite jam (shhh it's a secret), we think the deal will be sealed.")
schedule_11 = Schedule.create!(wedding_id: wedding_3.id, time: "12pm", description: "Although the courthouse will have our signatures on the dotted line, we know it won't be real in our eyes until you help us make the commitment. After some lip-locking, a Pablo Neruda poem and the string-quartet version of our all-time favorite jam (shhh it's a secret), we think the deal will be sealed.")
schedule_12 = Schedule.create!(wedding_id: wedding_3.id, time: "7pm", description: "Although the courthouse will have our signatures on the dotted line, we know it won't be real in our eyes until you help us make the commitment. After some lip-locking, a Pablo Neruda poem and the string-quartet version of our all-time favorite jam (shhh it's a secret), we think the deal will be sealed.")

puts"schedule created #{Schedule.count}"

# accomodation_info_1 = AccomodationInfo.create!(wedding_id: wedding_1.id, url: "www.http/.com", title: "Manor hotel", description: "affordable 4 star hotel")
# accomodation_info_2 = AccomodationInfo.create!(wedding_id: wedding_2.id, url: "www.http/.com", title: "Foster hotel", description: "cheap 3 star hotel")
# accomodation_info_3 = AccomodationInfo.create!(wedding_id: wedding_3.id, url: "www.http/.com", title: "Hilton hotel", description: "expensive 5 star hotel")
# accomodation_info_4 = AccomodationInfo.create!(wedding_id: wedding_4.id, url: "www.http/.com", title: "Premier Inn", description: "cheap hotels")

# puts"accomodation_info created #{AccomodationInfo.count}"

# registry_1 = Registry.create!(user_id: user1.id, item_name: "Send money", description: "send the couple money")
# registry_2 = Registry.create!(user_id: user2.id, item_name: "Toaster", description: "A gold toaster")
# registry_3 = Registry.create!(user_id: user3.id, item_name: "Double bed", description: "Get the couple a double bed")
# registry_4 = Registry.create!(user_id: user4.id, item_name: "Air fryer", description: "Get the couple a air fryer because they can't cook to save their lives")

# puts"registry created #{Registry.count}"

# registry_item_1 = RegistryItem.create!(registry_id: registry_1.id, wedding_id: wedding_1.id)
# registry_item_2 = RegistryItem.create!(registry_id: registry_2.id, wedding_id: wedding_2.id)
# registry_item_3 = RegistryItem.create!(registry_id: registry_3.id, wedding_id: wedding_3.id)
# registry_item_4 = RegistryItem.create!(registry_id: registry_4.id, wedding_id: wedding_4.id)

# puts"registry_item created #{RegistryItem.count}"

# wedding_guest_1 = WeddingGuest.create!(user_id: user1.id, wedding_id: wedding_1.id)
# wedding_guest_2 = WeddingGuest.create!(user_id: user2.id, wedding_id: wedding_2.id)
# wedding_guest_3 = WeddingGuest.create!(user_id: user3.id, wedding_id: wedding_3.id)
# wedding_guest_4 = WeddingGuest.create!(user_id: user4.id, wedding_id: wedding_4.id)

# puts"wedding_guest created #{WeddingGuest.count}"

rsvp_1 = Rsvp.new(meal_choice: "Chicken", spotify_song: "Moutains, Biffy Clyro", attendance: "Yes", attendee: "Rory Jackson")
rsvp_1.wedding = wedding_2
rsvp_1.save!
rsvp_2 = Rsvp.new(meal_choice: "Steak", spotify_song: "Get free, Major Lazer", attendance: "No", attendee: "Zoe Addleton")
rsvp_2.wedding = wedding_2
rsvp_2.save!
rsvp_3 = Rsvp.new(meal_choice: "Gluten free", spotify_song: "Stairway to Heaven, Led Zeppelin", attendance: "Yes", attendee: "Lousie Swinburne")
rsvp_3.wedding = wedding_2
rsvp_3.save!
rsvp_4 = Rsvp.new(meal_choice: "Vegan", spotify_song: "Hello, Adele", attendance: "Yes", attendee: "Orla James")
rsvp_4.wedding = wedding_2
rsvp_4.save!

puts 'Creating 120 fake names'

120.times do
  rsvp = Rsvp.create(
    attendee: Faker::Name.name,
    attendance: ["Yes", "No"].sample,
    meal_choice: ["Chicken", "Steak","Gluten free","Vegan"].sample,
    spotify_song: Faker::Music.band
  )
  rsvp.wedding = wedding_2
  rsvp.save!
end
puts 'Finished!'
