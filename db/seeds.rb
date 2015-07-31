require 'faker'

10.times do |num|
	User.create(
		email: Faker::Internet.email,
		password: Faker::Internet.password)
end