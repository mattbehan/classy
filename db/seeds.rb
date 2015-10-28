require 'faker'

shirt_sizes = ["S", "M", "L", "XL"]
genders = ["M", "F", "Not Provided"]


# change seed file for heroku so emails and confirmations are not sent for seeds
50.times do
  teacher = Teacher.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                  email: Faker::Internet.email, password: "password")
  teacher.confirm!
end

250.times do
  Student.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                  gender: genders.sample, grade: rand(9..12), gpa: rand(0..4).to_f,
                  detentions: rand(1..10), t_shirt_size: shirt_sizes.sample, teacher_id: rand(1..50))
end

