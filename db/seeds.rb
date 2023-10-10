require 'faker'

User.destroy_all

puts "Starting seed"

PHONES = [
  "(11)98345-9876", "(14)98545-6566", "(11)98345-9878", "(88)98345-9676",
  "(34)98345-9876", "(11)98345-9876", "(31)98765-2364", "(31)45678-9012",
  "(41)55555-0000", "(51)11111-2222"
]

def create_fake_user
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    phone: PHONES.sample,
    cpf: Faker::IDNumber.brazilian_citizen_number(formatted: true)
  )
  user.save
end

10.times do
  create_fake_user
end

puts "Users created!"
