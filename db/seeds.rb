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

wedding_1 = Wedding.new(user_id: user1.id, page_heading: "Mustak and Sharon", info: "Mustak and Sharon met while both out with their groups of friends at a bar in Phoenix. After catching each other’s eye across the room and spending the  rest of the night finding out how much they have in common, they started dating. Things started to get exciting for the pair and two years later, we're best friends, true loves, and badass partners in life. We're finally ready to make it official!.", date:"2023-05-16")
file = URI.open("https://images.pexels.com/photos/1024993/pexels-photo-1024993.jpeg?cs=srgb&dl=pexels-asad-photo-maldives-1024993.jpg&fm=jpg")
wedding_1.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
wedding_1.save!

wedding_2 = Wedding.new(user_id: user2.id, page_heading: "Zoe and Cameron", info: "If we had it our way, all of us would be on a pontoon gambling boat this weekend with Dark and Stormy's in hand, setting sail for 80 degree weather. Since our parents have been patiently waiting for a ceremony though, we decided June nuptials in the city would suffice. There are plenty of wish lanterns to be lit and bottles of champagne waiting to be popped all we need are your lovely faces.", date:"2022-09-16")
file= URI.open("https://res.cloudinary.com/dzyug4vno/image/upload/v1663071844/development/DSC02485_g4xrxf.jpg")
file1 = URI.open("https://images.pexels.com/photos/948185/pexels-photo-948185.jpeg?cs=srgb&dl=pexels-rocsana-nicoleta-gurza-948185.jpg&fm=jpg")
file2 = URI.open("https://images.pexels.com/photos/1486101/pexels-photo-1486101.jpeg?cs=srgb&dl=pexels-dimitri-kuliuk-1486101.jpg&fm=jpg")
file3 = URI.open("https://images.pexels.com/photos/7119194/pexels-photo-7119194.jpeg?cs=srgb&dl=pexels-pavel-danilyuk-7119194.jpg&fm=jpg")

wedding_2.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
wedding_2.photos.attach(io: file1, filename: "nes.png", content_type: "image/png")
wedding_2.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
wedding_2.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")

wedding_2.save!

wedding_3 = Wedding.new(user_id: user3.id, page_heading: "Michelle and Barry", info: "He thought she was cute. She thought he was ignoring her. She thought he was rude. He forgot her name. He asked her out. She arrived 10 minutes late. They trained together then made it official. He proposed. She said yes.Yet it wasn't until a group outing where they were left alone on the dance floor, grooving to funky soul beats, when they knew they were meant to be together.", date:"2023-12-29")
file = URI.open("https://images.pexels.com/photos/1573007/pexels-photo-1573007.jpeg?cs=srgb&dl=pexels-taras-budniak-1573007.jpg&fm=jpg")
wedding_3.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
wedding_3.save!

puts "user created #{Wedding.count} weddings"

puts "creating 4 accomodations"
accomodation1 = AccomodationInfo.create(title: "Ritz Paris - Stay with us", description: "The Ritz Paris has reopened in June 2016 after an unprecedented restoration. The legendary hotel opens its doors with 71 luxurious suites, including 16 historic Prestige Suites, and 71 rooms. ", address: "15 Place Vendome, 75001 Paris France", wedding: wedding_2)
accomodation2 = AccomodationInfo.create(title: "Kimpton St Honore Paris", description: "Moments away from the Opera House, the iconic department stores, the Faubourg St Honoré and the Tuileries Garden, Kimpton St Honoré Paris features 249 beautifully appointed guestrooms and suites.", address: "27-29 boulevard des Capucines, 75002 Paris France", wedding: wedding_2)
accomodation3 = AccomodationInfo.create(title: "Hyatt Regency Paris", description: "Hyatt Regency Paris Etoile, formerly the renowned Hotel Concorde La Fayette, stands as one of the most impressive properties in the city.", address: "22 rue Danielle Casanova, 75002 Paris France", wedding: wedding_2)
accomodation4 = AccomodationInfo.create(title: "The Westin Paris", description: "4-star hotel with 24-hour fitness and swimming pool, near the city center.", address: "3, Rue De Castiglione, 75001 Paris France", wedding: wedding_2)

puts "user created #{AccomodationInfo.count} accomdations"

vip_1 = Vip.create!(wedding_id: wedding_1.id, name: "Mustak", description: "First person to hit the reception dance floor after the couple: “Me. But Chase is notorious for that, too. I foresee and real dirty dance-off.", category: "Best man")

puts"wedding created #{Wedding.count}"

vip_1 = Vip.new(wedding_id: wedding_2.id, name: "Mustak", description: "First person to hit the reception dance floor after the couple: “Me. But Chase is notorious for that, too. I foresee and real dirty dance-off.", category: "Groomsman")
file = URI.open("https://images.pexels.com/photos/845457/pexels-photo-845457.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-845457.jpg&fm=jpg")
vip_1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
vip_1.save!
vip_2 = Vip.new(wedding_id: wedding_2.id, name: "Rory", description: "Must-have survival supply: “A Leatherman. And a flask of Heaven Hill whiskey, for those chilly nights camping you never know when you'll get unexpected company.”", category: "Groomsman")
file = URI.open("https://images.pexels.com/photos/1851164/pexels-photo-1851164.jpeg?cs=srgb&dl=pexels-charles-1851164.jpg&fm=jpg")
vip_2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
vip_2.save!
vip_3 = Vip.new(wedding_id: wedding_2.id, name: "Sharon", description: "Best book to bring on vacation: “Tiny Beautiful Things by Cheryl Strayed. It's smart and witty and fun. Since the book is a collection of advice-column letters, you can flip open and read a couple at a time, which is nice for a bus ride or before a nap by the ocean.", category: "Bridesmaid")
file = URI.open("https://images.pexels.com/photos/762080/pexels-photo-762080.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-762080.jpg&fm=jpg")
vip_3.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
vip_3.save!
vip_4 = Vip.new(wedding_id: wedding_2.id, name: "Tony", description: "Tony is thoroughly prepared for their trip down the aisle and there's no chance he's slipping up on the big day. Although, he's never quite mastered that pesky letting go part. So he isn't making any promises.", category: "Groomsman" )
file = URI.open("https://images.pexels.com/photos/39866/entrepreneur-startup-start-up-man-39866.jpeg?cs=srgb&dl=pexels-pixabay-39866.jpg&fm=jpg")
vip_4.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
vip_4.save!
vip_5 = Vip.new(wedding_id: wedding_2.id, name: "Michael", description: "You're at karaoke, what is your go-to crowd pleaser? “The last time I hit the mic, maybe two years ago, it was my buddy's bachelor party weekend. I did that Les Mis song 'On My Own'. Don't judge. It was after numerous Sake bombs, and, for the record, it brought down the house", category: "Groomsman" )
file = URI.open("https://images.pexels.com/photos/428333/pexels-photo-428333.jpeg?cs=srgb&dl=pexels-spencer-selover-428333.jpg&fm=jpg")
vip_5.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
vip_5.save!
vip_6 = Vip.new(wedding_id: wedding_2.id, name: "Louise", description: "She knows all the words to that Disney musical (you know the one) and has moves to match. Dance partners need not apply, Louise already got her queued up for the second dance at the reception.", category: "Bridesmaid" )
file = URI.open("https://images.pexels.com/photos/1130624/pexels-photo-1130624.jpeg?cs=srgb&dl=pexels-vinicius-wiesehofer-1130624.jpg&fm=jpg")
vip_6.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
vip_6.save!
vip_7 = Vip.new(wedding_id: wedding_2.id, name: "Jerry", description: "You're at karaoke, what is your go-to crowd pleaser? “The last time I hit the mic, maybe two years ago, it was my buddy's bachelor party weekend. I did that Les Mis song 'On My Own'. Don't judge. It was after numerous Sake bombs, and, for the record, it brought down the house", category: "Groomsman" )
file = URI.open("https://images.pexels.com/photos/2058659/pexels-photo-2058659.jpeg?cs=srgb&dl=pexels-humphrey-muleba-2058659.jpg&fm=jpg")
vip_7.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
vip_7.save!
vip_8 = Vip.new(wedding_id: wedding_2.id, name: "Shaleen", description: "It's smart and witty and fun. Since the book is a collection of advice-column letters, you can flip open and read a couple at a time, which is nice for a bus ride or before a nap by the ocean.", category: "Bridesmaid" )
file = URI.open("https://images.pexels.com/photos/1848565/pexels-photo-1848565.jpeg?cs=srgb&dl=pexels-luizclas-1848565.jpg&fm=jpg")
vip_8.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
vip_8.save!
vip_9 = Vip.new(wedding_id: wedding_2.id, name: "Emma", description: "You're at karaoke, what is your go-to crowd pleaser? “The last time I hit the mic, maybe two years ago, it was my buddy's bachelor party weekend. I did that Les Mis song 'On My Own'. Don't judge. It was after numerous Sake bombs, and, for the record, it brought down the house", category: "Bridesmaid" )
file = URI.open("https://images.pexels.com/photos/354951/pexels-photo-354951.jpeg?cs=srgb&dl=pexels-pixabay-354951.jpg&fm=jpg")
vip_9.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
vip_9.save!
vip_10 = Vip.new(wedding_id: wedding_2.id, name: "Sally", description: "Need an insider's guide to Montauk? Next to our Place page. He's been coming here for decades (or is it centuries?). When it comes to shucking oysters, shelling lobsters, or just cracking jokes he's your go-to guy.", category: "Groomsman" )
file = URI.open("https://images.pexels.com/photos/450214/pexels-photo-450214.jpeg?cs=srgb&dl=pexels-royal-anwar-450214.jpg&fm=jpg")
vip_10.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
vip_10.save!
vip_11 = Vip.new(wedding_id: wedding_2.id, name: "Saki and Margaret", description: "We were worried that you wouldn't be able to recognize Rory's beautiful mother from a typical portrait, as her most noticeable facial feature is her camera. She'll certainly be accessorizing with her Canon on the big day, taking snaps and (hopefully) taking in the moment as well.", category: "Parent of the groom" )
file = URI.open("https://images.pexels.com/photos/7233202/pexels-photo-7233202.jpeg?cs=srgb&dl=pexels-kampus-production-7233202.jpg&fm=jpg")
vip_11.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
vip_11.save!
vip_12 = Vip.new(wedding_id: wedding_2.id, name: "Charlie and Janet", description: "Jame's father is very relieved were including a photo of him on our site, because he, in his own words, is “just sick and tired of being mistaken for Grey's brother” and “won't have it anymore!” And that's all you really need to know about the amazing Hank." , category: "Parent of the bride" )
file = URI.open("https://images.pexels.com/photos/3831156/pexels-photo-3831156.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-3831156.jpg&fm=jpg")
vip_12.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
vip_12.save!

puts"vip created #{Vip.count}"

# schedule_1 = Schedule.create!(wedding_id: wedding_1.id, time: "9am", description: "Although the courthouse will have our signatures on the dotted line, we know it won't be real in our eyes until you help us make the commitment. After some lip-locking, a Pablo Neruda poem and the string-quartet version of our all-time favorite jam (shhh it's a secret), we think the deal will be sealed.")
# schedule_2 = Schedule.create!(wedding_id: wedding_1.id, time: "12:30pm", description: "Although the courthouse will have our signatures on the dotted line, we know it won't be real in our eyes until you help us make the commitment. After some lip-locking, a Pablo Neruda poem and the string-quartet version of our all-time favorite jam (shhh it's a secret), we think the deal will be sealed")
# schedule_3 = Schedule.create!(wedding_id: wedding_1.id, time: "12pm", description: "Although the courthouse will have our signatures on the dotted line, we know it won't be real in our eyes until you help us make the commitment. After some lip-locking, a Pablo Neruda poem and the string-quartet version of our all-time favorite jam (shhh it's a secret), we think the deal will be sealed")
# schedule_4 = Schedule.create!(wedding_id: wedding_1.id, time: "7pm", description: "Although the courthouse will have our signatures on the dotted line, we know it won't be real in our eyes until you help us make the commitment. After some lip-locking, a Pablo Neruda poem and the string-quartet version of our all-time favorite jam (shhh it's a secret), we think the deal will be sealed")
schedule_5 = Schedule.create!(wedding_id: wedding_2.id, time: "9am", description: "Breakfast in the hotel restaurant. Lets start the day with a glass of champagne!")
schedule_6 = Schedule.create!(wedding_id: wedding_2.id, time: "12:30pm", description: "Arrival at the church, get yourselves seated in readiness for the arrival of the bride")
schedule_7 = Schedule.create!(wedding_id: wedding_2.id, time: "4:30pm", description: "Everyone make their way to the reception lobby for some more drinks and nibbles")
schedule_8 = Schedule.create!(wedding_id: wedding_2.id, time: "6pm", description: "Whos hungry? Its dinner time, lets fill our bellys")
schedule_9 = Schedule.create!(wedding_id: wedding_2.id, time: "9pm", description: "Our live band will kick off with some iconic songs to get us all grooving!")

# schedule_9 = Schedule.create!(wedding_id: wedding_3.id, time: "9am", description: "Although the courthouse will have our signatures on the dotted line, we know it won't be real in our eyes until you help us make the commitment. After some lip-locking, a Pablo Neruda poem and the string-quartet version of our all-time favorite jam (shhh it's a secret), we think the deal will be sealed.")
# schedule_10 = Schedule.create!(wedding_id: wedding_3.id, time: "12:30pm", description: "Although the courthouse will have our signatures on the dotted line, we know it won't be real in our eyes until you help us make the commitment. After some lip-locking, a Pablo Neruda poem and the string-quartet version of our all-time favorite jam (shhh it's a secret), we think the deal will be sealed.")
# schedule_11 = Schedule.create!(wedding_id: wedding_3.id, time: "12pm", description: "Although the courthouse will have our signatures on the dotted line, we know it won't be real in our eyes until you help us make the commitment. After some lip-locking, a Pablo Neruda poem and the string-quartet version of our all-time favorite jam (shhh it's a secret), we think the deal will be sealed.")
# schedule_12 = Schedule.create!(wedding_id: wedding_3.id, time: "7pm", description: "Although the courthouse will have our signatures on the dotted line, we know it won't be real in our eyes until you help us make the commitment. After some lip-locking, a Pablo Neruda poem and the string-quartet version of our all-time favorite jam (shhh it's a secret), we think the deal will be sealed.")

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
