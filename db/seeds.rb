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

patient1 = { first_name: "Filomena", last_name: "Schimmel", email: "filomena@schimmel.com", password: '123456', is_therapist: false }
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

therapist1 = { first_name: "Selma", last_name: "Kshlerin", email: "selma@kshlerin.com", password: '123456',
               is_therapist: true, area_of_expertise: "Addiction & Recovery", years_of_experience: 25,
               description: "In psychological counseling and therapy I stand for a trusting and respectful cooperation to clarify your problems and concerns. I offer psychological counseling to develop coherent action steps, a goal- and resource-oriented approach to build a better quality of life." }
therapist2 = { first_name: "Hiram", last_name: "Bogan", email: "hiram@bogan.com", password: '123456',
               is_therapist: true, area_of_expertise: "Anxiety", years_of_experience: 17,
               description: "Every therapy draws its effectiveness to a high degree from a sustainable therapeutic relationship. Therefore, in my work with you, an encounter at eye level, characterized by empathy, respect and mutual appreciation, is particularly important to me. I always try to approach my patients with an authentic and compassionate attitude. In this way, we create an atmosphere together that enables you to feel safe and allows you to open up and confront difficult issues." }
therapist3 = { first_name: "Brent", last_name: "Langworth", email: "brent@langworth", password: '123456',
               is_therapist: true, area_of_expertise: "Stress Management", years_of_experience: 5.5,
               description: "I work according to a cognitive-behavioral therapy concept, which means that I assume that certain thought patterns/attitudes and behavior patterns that have contributed to the development of the psychological complaints and the symptoms have been learned and can also be unlearned."}
therapist4 = { first_name: "Johnson", last_name: "Labadie", email: "johnson@labadie.com", password: '123456',
               is_therapist: true, area_of_expertise: "Depression", years_of_experience: 1,
               description: "Based on my qualifications and experience, my therapeutic work encompasses the entire spectrum of mental illness. A particular focus is on the treatment of anxiety disorders, depression, obsessive-compulsive disorder, and post-traumatic stress disorder, as well as support for grief reactions, coping with illness, and burn-out. I work with an emphasis in behavioral therapy and also use a variety of interventions tailored to individual cases." }
therapist5 = { first_name: "Kristyn", last_name: "Lindgren", email: "kristyn@lindgren.com", password: '123456',
               is_therapist: true, area_of_expertise: "Grief and Loss", years_of_experience: 2.5,
               description: "I work according to the focus of depth psychology-based psychotherapy. The therapeutic approach of depth psychology is based on the assumption that unconscious or misunderstood desires, motives or conflicts are hidden behind psychological disorders. It is also referred to as the depth of time, i.e. it is assumed that influences from childhood and adolescence strongly influence our later life."}

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
