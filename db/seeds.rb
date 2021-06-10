
require "open-uri"

User.destroy_all
Slot.destroy_all
Booking.destroy_all
Review.destroy_all

puts "begin users"

user1 = User.create!(first_name: "Alizée", last_name: "Juan", email: "alizeemelanie@gmail.com", password: "password", address: "187 rue Paradis 13006 Marseille", degree: "CAP agent de propreté et d'hygiène", years_of_experience: 5)
file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
user1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user1.save

user2 = User.create!(first_name: "Margaux", last_name: "Rouanet", email: "rouanetmargaux@gmail.com", password: "password2", address: "120 cours Lieutaud 13006 Marseille", degree: "Bac pro hygiène, propreté et stérilisation", years_of_experience: 2)
file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
user2.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user2.save

user3 = User.create!(first_name: "Imrane", last_name: "Moumini", email: "ImraneMouminiPro@gmail.com", password: "password3", address: "5 rue Marengo 13006 Marseille", degree: "BTS métiers des services à l'environnement", years_of_experience: 4)
file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
user3.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user3.save

user4 = User.create!(first_name: "Selma", last_name: "Benmeradi", email: "selma.benmeradi@gmail.com", password: "password4", address: "20 rue Bel Air 13006 Marseille", degree: "BEP en maintenance et hygiène des locaux", years_of_experience: 1)
file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
user4.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user4.save

user5 = User.create!(first_name: "Paul", last_name: "Duffour", email: "paul.duffour@gmail.com", password: "password5", address: "8 rue Bel Air 13006 Marseille", degree: "CAP agent de propreté et d'hygiène", years_of_experience: 4)
file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
user5.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user5.save



user6 = User.create!(first_name: "Jean", last_name: "Loup", email: "jean.loup@gmail.com", password: "password6", address: "4 rue du Village 13006 Marseille", degree: "BEP en maintenance et hygiène des locaux", years_of_experience: 2)
file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
user6.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user6.save

puts "end users"

puts "begin slot"


slot1 = Slot.create!(user_id: user1.id, day: Date.parse("2021-6-22"), start_time: Time.parse("12:00:00"), end_time: Time.parse("17:00:00"))

slot2 = Slot.create!(user_id: user2.id, day: Date.parse("2021-6-21"), start_time: Time.parse("12:00:00"), end_time: Time.parse("17:00:00"))

slot3 = Slot.create!(user_id: user3.id, day: Date.parse("2021-6-20"), start_time: Time.parse("12:00:00"), end_time: Time.parse("17:00:00"))

slot4 = Slot.create!(user_id: user4.id, day: Date.parse("2021-6-24"), start_time: Time.parse("09:00:00"), end_time: Time.parse("13:00:00"))

slot5 = Slot.create!(user_id: user5.id, day: Date.parse("2021-6-25"), start_time: Time.parse("09:00:00"), end_time: Time.parse("13:00:00"))

slot6 = Slot.create!(user_id: user6.id, day: Date.parse("2021-6-23"), start_time: Time.parse("09:00:00"), end_time: Time.parse("13:00:00"))

puts "end slot"

puts "begin booking"

booking1 = Booking.create!(user_id: user1.id, slot_id: slot1.id, start_time: Time.parse("12:00:00"), end_time: Time.parse("14:00:00"), status: true)

booking2 = Booking.create!(user_id: user2.id, slot_id: slot2.id, start_time: Time.parse("12:00:00"), end_time: Time.parse("14:00:00"), status: true)

booking3 = Booking.create!(user_id: user3.id, slot_id: slot3.id, start_time: Time.parse("12:00:00"), end_time: Time.parse("14:00:00"), status: true)

booking4 = Booking.create!(user_id: user4.id, slot_id: slot4.id, start_time: Time.parse("09:00:00"), end_time: Time.parse("11:00:00"), status: true)

booking5 = Booking.create!(user_id: user5.id, slot_id: slot5.id, start_time: Time.parse("10:00:00"), end_time: Time.parse("12:00:00"), status: true)

booking6 = Booking.create!(user_id: user6.id, slot_id: slot6.id, start_time: Time.parse("10:00:00"), end_time: Time.parse("12:00:00"), status: true)

puts "end booking"

puts "begin review"

review1 = Review.create!(content: "Alizée a fait du super travail, merci encore!", rating: 4, user_id: user1.id)

review2 = Review.create!(content: "Margaux m'a bien dépanné sur ce coup là, super taff!", rating: 5, user_id: user2.id)

review3 = Review.create!(content: "Encore un peu de poussière mais le gros du travail a été fait merci Imrane", rating: 2, user_id: user3.id)

review4 = Review.create!(content: "Très sympathique et efficace", rating: 3, user_id: user4.id)

review5 = Review.create!(content: "Bonne communication mais pas très efficace", rating: 2, user_id: user5.id)

review6 = Review.create!(content: "Jean a remis mon salon en super état après une grosse soirée, merci!", rating: 4, user_id: user6.id)


puts "end review"
