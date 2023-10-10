require 'faker'

puts "Starting seed"

def create_fake_user
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    cpf: Faker::IDNumber.brazilian_citizen_number
  )
end

15.times do
  create_fake_user
end

puts "Users created!"
