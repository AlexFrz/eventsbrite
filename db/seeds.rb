# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'rubocop-faker'


User.destroy_all
Event.destroy_all
Attendance.destroy_all

10.times do 
    @user = User.create(
		last_name: Faker::Name.last_name,
		first_name: Faker::Name.first_name,
		email: Faker::Internet.email,
		description: Faker::Quote.yoda, 
		encrypted_password: "fdpntm"
		)
    puts "#{@user.first_name} added!"
    
    @event = Event.create(
		title: Faker::Lorem.sentence(word_count: 3),
		start_date: Faker::Time.forward(days: 90, period: :day),
		duration: rand(1..40)*5,
		description: Faker::Lorem.paragraph,
		price: rand(1..100),
		location: Faker::Address.city,
		organizer: @user
        )

    puts "#{@event.title} added!"

    @attendance = Attendance.create(
		stripe_customer_id: Faker::Lorem.sentence(word_count: 1),
		user: @user,
		event: @event
		)
	puts "Attendance added!"
end

@bob = User.create(
	last_name: "Marley",
	first_name: "Bob",
	email: "rastafari@yopmail.com",
	description: "No woman no cry!", 
	encrypted_password: "bouyashaka"
	) 
puts "Bobby Marley added !"