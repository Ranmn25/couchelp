# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require 'faker'

puts 'Cleaning database...'
User.destroy_all
puts 'Creating 5 patients'

patient1 = { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '123456', is_therapist: false }
patient2 = { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '123456', is_therapist: false }
patient3 = { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '123456', is_therapist: false }
patient4 = { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '123456', is_therapist: false }
patient5 = { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '123456', is_therapist: false }

patientone = User.create!(patient1)
patienttwo = User.create!(patient2)
patientthree = User.create!(patient3)
patientfour = User.create!(patient4)
patientfive = User.create!(patient5)

puts "#{patientone.first_name} #{patientone.last_name} created"
puts "#{patienttwo.first_name} #{patienttwo.last_name} created"
puts "#{patientthree.first_name} #{patientthree.last_name} created"
puts "#{patientfour.first_name} #{patientfour.last_name} created"
puts "#{patientfive.first_name} #{patientfive.last_name} created"

file1 = URI.open('https://source.unsplash.com/I9jIv3Z4Qew')
file2 = URI.open('https://source.unsplash.com/BRJDoOstnlY')
file3 = URI.open('https://source.unsplash.com/HFHquP56Ph4')
file4 = URI.open('https://source.unsplash.com/Qeh9s0bPgF4')
file5 = URI.open('https://source.unsplash.com/T05O-kChXTk')

patientone.photo.attach(io: file1, filename: 'image1.png', content_type: 'image/png')
patienttwo.photo.attach(io: file2, filename: 'image2.png', content_type: 'image/png')
patientthree.photo.attach(io: file3, filename: 'image3.png', content_type: 'image/png')
patientfour.photo.attach(io: file4, filename: 'iamge4.png', content_type: 'image/png')
patientfive.photo.attach(io: file5, filename: 'iamge5.png', content_type: 'image/png')

# Therapist Seed
puts 'Creating 5 therapists'

therapist1 = { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '123456', is_therapist: true }
therapist2 = { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '123456', is_therapist: true }
therapist3 = { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '123456', is_therapist: true }
therapist4 = { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '123456', is_therapist: true }
therapist5 = { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '123456', is_therapist: true }

therapistone = User.create!(therapist1)
therapisttwo = User.create!(therapist2)
therapistthree = User.create!(therapist3)
therapistfour = User.create!(therapist4)
therapistfive = User.create!(therapist5)

puts "#{therapistone.first_name} #{therapistone.last_name} created"
puts "#{therapisttwo.first_name} #{therapisttwo.last_name} created"
puts "#{therapistthree.first_name} #{therapistthree.last_name} created"
puts "#{therapistfour.first_name} #{therapistfour.last_name} created"
puts "#{therapistfive.first_name} #{therapistfive.last_name} created"

file1 = URI.open('https://source.unsplash.com/FVh_yqLR9eA')
file2 = URI.open('https://source.unsplash.com/pTrhfmj2jDA')
file3 = URI.open('https://source.unsplash.com/7bMdiIqz_J4')
file4 = URI.open('https://source.unsplash.com/279xIHymPYY')
file5 = URI.open('https://source.unsplash.com/IF9TK5Uy-KI')

therapistone.photo.attach(io: file1, filename: 'image1.png', content_type: 'image/png')
therapisttwo.photo.attach(io: file2, filename: 'image2.png', content_type: 'image/png')
therapistthree.photo.attach(io: file3, filename: 'image3.png', content_type: 'image/png')
therapistfour.photo.attach(io: file4, filename: 'iamge4.png', content_type: 'image/png')
therapistfive.photo.attach(io: file5, filename: 'iamge5.png', content_type: 'image/png')
puts 'finished'
