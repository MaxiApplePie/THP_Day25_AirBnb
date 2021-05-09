require "faker"

Faker::Config.locale = "fr"

Reservation.destroy_all
Accomodation.destroy_all
City.destroy_all
User.destroy_all
10.times do |index|
  City.create(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code,
  )
end
20.times do |u|
  User.create(
    email: Faker::Internet.free_email,
    phone_number: Faker::PhoneNumber.cell_phone,
    description: Faker::Name.name,
  )
end
50.times do |a|
  a = Accomodation.create(
    available_beds: rand(1..5),
    price: rand(40..230),
    description: Faker::Lorem.paragraph_by_chars(number: rand(145..180)),
    has_wifi: Faker::Boolean.boolean,
    welcome_message: "Bienvenue !",
    adm: User.all.sample,
    city: City.all.sample,
  )
  5.times do |index|
    var_date = Faker::Date.backward(days: rand(5..25))
    Reservation.create(
      start_date: var_date,
      # end_date: Faker::Date.between(from: "2010-01-01", to: "2024-01-01"),
      end_date: var_date + rand(3..15).days,
      accomodation_id: a.id,
      user_id: User.ids.sample,
    )
  end
  5.times do |index|
    var_date = Faker::Date.forward(days: rand(5..25))
    Reservation.create(
      start_date: var_date,
      # end_date: Faker::Date.between(from: "2010-01-01", to: "2024-01-01"),
      end_date: var_date + rand(3..15).days,
      accomodation_id: a.id,
      user_id: User.ids.sample,
    )
  end
end
# 25.times do |index|
#   var_date = Faker::Date.between(from: "2023-06-01", to: "2024-01-01")
#   Reservation.create(
#     start_date: var_date,
#     # end_date: Faker::Date.between(from: "2010-01-01", to: "2024-01-01"),
#     end_date: var_date + rand(3..15).days,
#     accomodation_id: Accomodation.ids.sample,
#     user_id: User.ids.sample,
#   )
# end
