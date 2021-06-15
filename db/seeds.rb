
require "open-uri"
Message.destroy_all
Chatroom.destroy_all
Review.destroy_all
Booking.destroy_all
Slot.destroy_all
User.destroy_all

puts "begin users"

user_alizée = User.create!(
  first_name: "Alizée",
  last_name: "Juan",
  email: "alizeemelanie@gmail.com",
  password: "password",
  address: "187 rue Paradis 13006 Marseille",
  degree: "CAP agent de propreté et d'hygiène",
  years_of_experience: 5,
  description: "Bonjour je m'appelle Alizée, je suis à votre disposition, compétente et motivée! Je serais prendre soin de votre intérieur comme il se doit ! Vous pouvez me faire confiance. Le contact avec les clients et une des choses que je préfère.",
  number_of_reviews: 56,
  user_price_cents: 1000
)
file = URI.open('https://1tb.favim.com/preview/6/659/6592/65929/6592935.jpg')
user_alizée.photo.attach(io: file, filename: 'alizéeprofilepic.jpg', content_type: 'image/jpg')
user_alizée.save


user_margaux = User.create!(first_name: "Margaux", last_name: "Rouanet", email: "rouanetmargaux@gmail.com", password: "password2", address: "120 cours Lieutaud 13006 Lille", degree: "Bac pro hygiène, propreté et stérilisation", years_of_experience: 2, description: "Bonjour je m'appelle Margaux, je suis à votre disposition, compétente et motivée! Je serais prendre soin de votre intérieur comme il se doit ! Vous pouvez me faire confiance. Le contact avec les clients et une des choses que je préfère.", number_of_reviews: 50, user_price_cents: 1000)
file = URI.open('https://shayaridp.in/wp-content/uploads/2020/05/smile-girl-profile-picture-whatsapp-dp-images.jpg')
user_margaux.photo.attach(io: file, filename: 'margauxpic.jpg', content_type: 'image/jpg')
user_margaux.save

user_imrane = User.create!(first_name: "Imrane", last_name: "Moumini", email: "ImraneMouminiPro@gmail.com", password: "password3", address: "5 rue Marengo 13006 Marseille", degree: "BTS métiers des services à l'environnement", years_of_experience: 4, description: "Bonjour je m'appelle Imrane, je suis à votre disposition, compétente et motivée! Je serais prendre soin de votre intérieur comme il se doit ! Vous pouvez me faire confiance. Le contact avec les clients et une des choses que je préfère.", number_of_reviews: 24, user_price_cents: 1000)
file = URI.open('https://smoothmove.co.za/wp-content/uploads/2021/02/pp1.jpg')
user_imrane.photo.attach(io: file, filename: 'imranepic.jpg', content_type: 'image/jpg')
user_imrane.save


cleaner_selma = User.create!(first_name: "Selma", last_name: "Benmeradi", email: "selma.benmeradi@gmail.com", password: "password4", address: "20 rue Bel Air 13006 Amiens", degree: "BEP en maintenance et hygiène des locaux", years_of_experience: 1, description: "Bonjour je m'appelle Selma, je suis à votre disposition, compétente et motivée! Je serais prendre soin de votre intérieur comme il se doit ! Vous pouvez me faire confiance. Le contact avec les clients et une des choses que je préfère.", number_of_reviews: 60, user_price_cents: 1000)
file = URI.open('https://techtrickseo.com/wp-content/uploads/2019/11/asfDFHJDKFHDFJH.jpg')
cleaner_selma.photo.attach(io: file, filename: 'selmapic.jpg', content_type: 'image/jpg')
cleaner_selma.save

cleaner_paul = User.create!(first_name: "Paul", last_name: "Duffour", email: "paul.duffour@gmail.com", password: "password5", address: "8 rue Bel Air 13006 Marseille", degree: "CAP agent de propreté et d'hygiène", years_of_experience: 4, description: "Bonjour je m'appelle Paul, je suis à votre disposition, compétente et motivée! Je serais prendre soin de votre intérieur comme il se doit ! Vous pouvez me faire confiance. Le contact avec les clients et une des choses que je préfère.", number_of_reviews: 45, user_price_cents: 1000)
file = URI.open('https://www.heysaturday.co/wp-content/uploads/2015/12/MG_0331cDigital.jpg')
cleaner_paul.photo.attach(io: file, filename: 'paulpic.jpg', content_type: 'image/jpg')
cleaner_paul.save



cleaner_jean = User.create!(first_name: "Jean", last_name: "Loup", email: "jean.loup@gmail.com", password: "password6", address: "4 rue du Village 13006 Marseille", degree: "BEP en maintenance et hygiène des locaux", years_of_experience: 2, description: "Bonjour je m'appelle Jean, je suis à votre disposition, compétente et motivée! Je serais prendre soin de votre intérieur comme il se doit ! Vous pouvez me faire confiance. Le contact avec les clients et une des choses que je préfère.", number_of_reviews: 15, user_price_cents: 1000)
file = URI.open('https://sm.askmen.com/askmen_in/article/f/facebook-p/facebook-profile-picture-affects-chances-of-gettin_gstt.jpg')
cleaner_jean.photo.attach(io: file, filename: 'jeanpic.jpg', content_type: 'image/jpg')
cleaner_jean.save

puts "end users"

puts "begin slot"

start = DateTime.now
slot1 = Slot.new(user_id: cleaner_selma.id)
slot1.start_time = start
slot1.end_time = start + 4.hours
slot1.save!


slot2 = Slot.create!(user_id: cleaner_paul.id, start_time: start, end_time: start + 4.hours)

slot3 = Slot.create!(user_id: cleaner_jean.id, start_time: start, end_time: start + 4.hours)


puts "end slot"

puts "begin booking and reviews"


booking1 = Booking.create!(user_id: user_alizée.id, slot_id: slot1.id, start_time: start, end_time: start + 1.hours, status: true, task_accomplished: false)
review1 = Review.create!(content: "#{booking1.slot.user.first_name} a fait du super travail, merci encore!", rating: 4, booking_id: booking1.id)

booking2 = Booking.create!(user_id: user_margaux.id, slot_id: slot2.id, start_time: start, end_time: start + 1.hours, status: true, task_accomplished: false)
review2 = Review.create!(content: "#{booking2.slot.user.first_name} m'a bien dépanné sur ce coup là, super taff!", rating: 5, booking_id: booking2.id)

booking3 = Booking.create!(user_id: user_imrane.id, slot_id: slot3.id, start_time: start, end_time: start + 1.hours, status: true, task_accomplished: false)
review3 = Review.create!(content: "Encore un peu de poussière mais le gros du travail a été fait merci #{booking3.slot.user.first_name}", rating: 2, booking_id: booking3.id)

puts "end booking and reviews"

#puts "begin review"

#review1 = Review.create!(content: "Alizée a fait du super travail, merci encore!", rating: 4, booking_id: booking2.id)

#review2 = Review.create!(content: "Margaux m'a bien dépanné sur ce coup là, super taff!", rating: 5, booking_id: booking3.id)

#review3 = Review.create!(content: "Encore un peu de poussière mais le gros du travail a été fait merci Imrane", rating: 2, booking_id: booking1.id)





puts "begin charoom"

chatroom1 = Chatroom.create(name: "general")

puts "end chatroom"

