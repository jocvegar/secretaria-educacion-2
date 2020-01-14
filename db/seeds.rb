require 'faker'

# (1..20).each do |num|
# 	user = User.create(email: "test_#{num}@example.com", password: "password", first_name: Faker::Name.unique.first_name,
# 			last_name: Faker::Name.unique.last_name, phone_number: Faker::PhoneNumber.cell_phone
# 	)
# end

teams = Team.create([
	{name: "Legal"},
	{name: "Contaduría"},
	{name: "Licitaciones"},
	{name: "Ambiental"},
	{name: "Gerencia"},
	{name: "Procesos"}
])
