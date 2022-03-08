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
patient2 = { first_name: "Laura", last_name: "Sucher", email: "laura@sucher.com", password: '123456', is_therapist: false }
patient3 = { first_name: "Ran", last_name: "Ran", email: "king@ran.com", password: '123456', is_therapist: false }
patient4 = { first_name: "Talia", last_name: "Azulay", email: "talia@azulay", password: '123456', is_therapist: false }
patient5 = { first_name: "Deepti", last_name: "Khatri", email: "deepti@khatri", password: '123456', is_therapist: false }

patientone = User.new(patient1)
patienttwo = User.new(patient2)
patientthree = User.new(patient3)
patientfour = User.new(patient4)
patientfive = User.new(patient5)

puts "#{patientone.first_name} #{patientone.last_name} created"
puts "#{patienttwo.first_name} #{patienttwo.last_name} created"
puts "#{patientthree.first_name} #{patientthree.last_name} created"
puts "#{patientfour.first_name} #{patientfour.last_name} created"
puts "#{patientfive.first_name} #{patientfive.last_name} created"

file1 = URI.open('https://source.unsplash.com/I9jIv3Z4Qew')
file2 = URI.open('https://res.cloudinary.com/ddbbm7ogw/image/upload/v1646579029/Laura_lyn03t.jpg')
file3 = URI.open('https://res.cloudinary.com/ddbbm7ogw/image/upload/v1646579417/ran_eyt0tl.jpg')
file4 = URI.open('https://res.cloudinary.com/ddbbm7ogw/image/upload/v1646579360/Talia_yhrmfa.jpg')
file5 = URI.open('https://source.unsplash.com/T05O-kChXTk')

patientone.photo.attach(io: file1, filename: 'image1.png', content_type: 'image/png')
patienttwo.photo.attach(io: file2, filename: 'image2.png', content_type: 'image/png')
patientthree.photo.attach(io: file3, filename: 'image3.png', content_type: 'image/png')
patientfour.photo.attach(io: file4, filename: 'iamge4.png', content_type: 'image/png')
patientfive.photo.attach(io: file5, filename: 'iamge5.png', content_type: 'image/png')

[patientone, patienttwo, patientthree, patientfour, patientfive].each { |patient| patient.save!}

# Therapist Seed
puts 'Creating 8 therapists'

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
therapist6 = { first_name: "Hallvard", last_name: "Stacks", email: "hallvard@stacks.com", password: '123456',
               is_therapist: true, area_of_expertise: "Couple therapy", years_of_experience: 30,
               description: "My personal attitude from my work as a psychologist, coach & intercultural manager in practices, institutions & companies - also in the treatment of mental illness is: Not looking at illnesses or problems, but focusing on your individual resources & strengths is what really gets you ahead. In my psychological work, the change of perspective is in the foreground away from the treatment of clinical pathology & pigeonholing to prevention & the promotion of your mental health."}
therapist7 = { first_name: "Posy", last_name: "Hunter", email: "posy@hunter.com", password: '123456',
               is_therapist: true, area_of_expertise: "Burnout", years_of_experience: 11,
               description: "My professional assessment, already in the first session, gives a much higher degree of clarity about which starting points you can choose to positively influence your situation. No matter if or how often you take advantage of further consultations. I provide you with effective tools, offer new perspectives, and impart important work psychology information that you can use to continue working on your own. Take a look at my corresponding individual practice services."}
therapist8 = { first_name: "Bushra", last_name: "Niwen", email: "bushra@niwen.com", password: '123456',
               is_therapist: true, area_of_expertise: "Burnout", years_of_experience: 19,
               description: "I am glad that you have found me. No matter what situation you are in, there are always at least two solutions to a problem. Please imagine working with me as if I were your companion. Because that is how I understand my task. Together we honestly look at where you are at the moment. Then I accompany you through holistic methods. Many of them you can apply yourself afterwards, so that you don't have to rely on the support of an expert forever."}

therapistone = User.new(therapist1)
therapisttwo = User.new(therapist2)
therapistthree = User.new(therapist3)
therapistfour = User.new(therapist4)
therapistfive = User.new(therapist5)
therapistsix = User.new(therapist6)
therapistseven = User.new(therapist7)
therapisteight = User.new(therapist8)

puts "#{therapistone.first_name} #{therapistone.last_name} created"
puts "#{therapisttwo.first_name} #{therapisttwo.last_name} created"
puts "#{therapistthree.first_name} #{therapistthree.last_name} created"
puts "#{therapistfour.first_name} #{therapistfour.last_name} created"
puts "#{therapistfive.first_name} #{therapistfive.last_name} created"
puts "#{therapistsix.first_name} #{therapistsix.last_name} created"
puts "#{therapistseven.first_name} #{therapistseven.last_name} created"
puts "#{therapisteight.first_name} #{therapisteight.last_name} created"

file1 = URI.open('https://source.unsplash.com/FVh_yqLR9eA')
file2 = URI.open('https://source.unsplash.com/pTrhfmj2jDA')
file3 = URI.open('https://source.unsplash.com/7bMdiIqz_J4')
file4 = URI.open('https://source.unsplash.com/279xIHymPYY')
file5 = URI.open('https://source.unsplash.com/IF9TK5Uy-KI')
file6 = URI.open('https://source.unsplash.com/6anudmpILw4')
file7 = URI.open('https://source.unsplash.com/OwLvUXlCgdY')
file8 = URI.open('https://source.unsplash.com/lnlSIsiSjjc')



therapistone.photo.attach(io: file1, filename: 'image1.png', content_type: 'image/png')
therapisttwo.photo.attach(io: file2, filename: 'image2.png', content_type: 'image/png')
therapistthree.photo.attach(io: file3, filename: 'image3.png', content_type: 'image/png')
therapistfour.photo.attach(io: file4, filename: 'iamge4.png', content_type: 'image/png')
therapistfive.photo.attach(io: file5, filename: 'iamge5.png', content_type: 'image/png')
therapistsix.photo.attach(io: file6, filename: 'iamge6.png', content_type: 'image/png')
therapistseven.photo.attach(io: file7, filename: 'iamge7.png', content_type: 'image/png')
therapisteight.photo.attach(io: file8, filename: 'iamge8.png', content_type: 'image/png')

[therapistone, therapisttwo, therapistthree, therapistfour, therapistfive, therapistsix, therapistseven, therapisteight].each { |therapist| therapist.save!}

# Bookings Seed
booking1 = { date: Date.tomorrow, time: Time.now, status: 'accepted', patient_id: patienttwo.id, therapist_id: therapisttwo.id }
booking2 = { date: Date.today - 14, time: Time.now, status: 'accepted', patient_id: patienttwo.id, therapist_id: therapisttwo.id }
booking3 = { date: Date.today - 30, time: Time.now, status: 'accepted', patient_id: patienttwo.id, therapist_id: therapisttwo.id }

bookingone = Booking.create!(booking1)
bookingtwo = Booking.create!(booking2)
bookingthree = Booking.create!(booking3)

puts "#{bookingone} created"
puts "#{bookingtwo} created"
puts "#{bookingthree} created"

puts 'finished'
