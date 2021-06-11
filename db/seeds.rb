
require "open-uri"
Review.destroy_all
Booking.destroy_all
Slot.destroy_all
User.destroy_all

puts "begin users"

user1 = User.create!(first_name: "Alizée", last_name: "Juan", email: "alizeemelanie@gmail.com", password: "password", address: "187 rue Paradis 13006 Marseille", degree: "CAP agent de propreté et d'hygiène", years_of_experience: 5, description: "Bonjour je m'appelle Alizée, je suis à votre disposition, compétente et motivée! Je serais prendre soin de votre intérieur comme il se doit ! Vous pouvez me faire confiance. Le contact avec les clients et une des choses que je préfère.", number_of_reviews: 56, user_price: 10)
file = URI.open('https://1tb.favim.com/preview/6/659/6592/65929/6592935.jpg')
user1.photo.attach(io: file, filename: 'alizéeprofilepic.jpg', content_type: 'image/jpg')
user1.save


user2 = User.create!(first_name: "Margaux", last_name: "Rouanet", email: "rouanetmargaux@gmail.com", password: "password2", address: "120 cours Lieutaud 13006 Lille", degree: "Bac pro hygiène, propreté et stérilisation", years_of_experience: 2, description: "Bonjour je m'appelle Margaux, je suis à votre disposition, compétente et motivée! Je serais prendre soin de votre intérieur comme il se doit ! Vous pouvez me faire confiance. Le contact avec les clients et une des choses que je préfère.", number_of_reviews: 50, user_price: 10)
file = URI.open('https://shayaridp.in/wp-content/uploads/2020/05/smile-girl-profile-picture-whatsapp-dp-images.jpg')
user2.photo.attach(io: file, filename: 'margauxpic.jpg', content_type: 'image/jpg')
user2.save

user3 = User.create!(first_name: "Imrane", last_name: "Moumini", email: "ImraneMouminiPro@gmail.com", password: "password3", address: "5 rue Marengo 13006 Marseille", degree: "BTS métiers des services à l'environnement", years_of_experience: 4, description: "Bonjour je m'appelle Imrane, je suis à votre disposition, compétente et motivée! Je serais prendre soin de votre intérieur comme il se doit ! Vous pouvez me faire confiance. Le contact avec les clients et une des choses que je préfère.", number_of_reviews: 24, user_price: 10)
file = URI.open('https://smoothmove.co.za/wp-content/uploads/2021/02/pp1.jpg')
user3.photo.attach(io: file, filename: 'imranepic.jpg', content_type: 'image/jpg')
user3.save


user4 = User.create!(first_name: "Selma", last_name: "Benmeradi", email: "selma.benmeradi@gmail.com", password: "password4", address: "20 rue Bel Air 13006 Amiens", degree: "BEP en maintenance et hygiène des locaux", years_of_experience: 1, description: "Bonjour je m'appelle Selma, je suis à votre disposition, compétente et motivée! Je serais prendre soin de votre intérieur comme il se doit ! Vous pouvez me faire confiance. Le contact avec les clients et une des choses que je préfère.", number_of_reviews: 60, user_price: 10)
file = URI.open('https://techtrickseo.com/wp-content/uploads/2019/11/asfDFHJDKFHDFJH.jpg')
user4.photo.attach(io: file, filename: 'selmapic.jpg', content_type: 'image/jpg')
user4.save

user5 = User.create!(first_name: "Paul", last_name: "Duffour", email: "paul.duffour@gmail.com", password: "password5", address: "8 rue Bel Air 13006 Marseille", degree: "CAP agent de propreté et d'hygiène", years_of_experience: 4, description: "Bonjour je m'appelle Paul, je suis à votre disposition, compétente et motivée! Je serais prendre soin de votre intérieur comme il se doit ! Vous pouvez me faire confiance. Le contact avec les clients et une des choses que je préfère.", number_of_reviews: 45, user_price: 10)
file = URI.open('https://www.heysaturday.co/wp-content/uploads/2015/12/MG_0331cDigital.jpg')
user5.photo.attach(io: file, filename: 'paulpic.jpg', content_type: 'image/jpg')
user5.save



user6 = User.create!(first_name: "Jean", last_name: "Loup", email: "jean.loup@gmail.com", password: "password6", address: "4 rue du Village 13006 Marseille", degree: "BEP en maintenance et hygiène des locaux", years_of_experience: 2, description: "Bonjour je m'appelle Jean, je suis à votre disposition, compétente et motivée! Je serais prendre soin de votre intérieur comme il se doit ! Vous pouvez me faire confiance. Le contact avec les clients et une des choses que je préfère.", number_of_reviews: 15, user_price: 10)
file = URI.open('https://sm.askmen.com/askmen_in/article/f/facebook-p/facebook-profile-picture-affects-chances-of-gettin_gstt.jpg')
user6.photo.attach(io: file, filename: 'jeanpic.jpg', content_type: 'image/jpg')
user6.save

puts "end users"

puts "begin slot"

start = DateTime.now
slot1 = Slot.new(user_id: user1.id)
slot1.start_time = start
slot1.end_time = start + 4.hours
slot1.save!


slot2 = Slot.create!(user_id: user2.id, start_time: start, end_time: start + 4.hours)

slot3 = Slot.create!(user_id: user3.id, start_time: start, end_time: start + 4.hours)

slot4 = Slot.create!(user_id: user4.id, start_time: start, end_time: start + 4.hours)

slot5 = Slot.create!(user_id: user5.id, start_time: start, end_time: start + 4.hours)

slot6 = Slot.create!(user_id: user6.id, start_time: start, end_time: start + 4.hours)

puts "end slot"

puts "begin booking"


booking1 = Booking.create!(user_id: user1.id, slot_id: slot1.id, start_time: start, end_time: start + 1.hours, status: true, task_accomplished: true, booking_price: user1.user_price)

booking2 = Booking.create!(user_id: user2.id, slot_id: slot2.id, start_time: start, end_time: start + 1.hours, status: true, task_accomplished: false, booking_price: user2.user_price)

booking3 = Booking.create!(user_id: user3.id, slot_id: slot3.id, start_time: start, end_time: start + 1.hours, status: true, task_accomplished: true, booking_price: user3.user_price)

booking4 = Booking.create!(user_id: user4.id, slot_id: slot4.id, start_time: start, end_time: start + 4.hours, status: true, task_accomplished: false, booking_price: user4.user_price)

booking5 = Booking.create!(user_id: user5.id, slot_id: slot5.id, start_time: start, end_time: start + 4.hours, status: true, task_accomplished: true, booking_price: user5.user_price)

booking6 = Booking.create!(user_id: user6.id, slot_id: slot6.id, start_time: start, end_time: start + 4.hours, status: true, task_accomplished: false, booking_price: user6.user_price)


puts "end booking"

puts "begin review"

review1 = Review.create!(content: "Alizée a fait du super travail, merci encore!", rating: 4, user_id: user1.id)

review2 = Review.create!(content: "Margaux m'a bien dépanné sur ce coup là, super taff!", rating: 5, user_id: user2.id)

review3 = Review.create!(content: "Encore un peu de poussière mais le gros du travail a été fait merci Imrane", rating: 2, user_id: user3.id)

review4 = Review.create!(content: "Très sympathique et efficace", rating: 3, user_id: user4.id)

review5 = Review.create!(content: "Bonne communication mais pas très efficace", rating: 2, user_id: user5.id)

review6 = Review.create!(content: "Jean a remis mon salon en super état après une grosse soirée, merci!", rating: 4, user_id: user6.id)


puts "end review"
