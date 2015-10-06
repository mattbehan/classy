require 'faker'

shirt_sizes = ["S", "M", "L", "XL"]

50.times do
  Teacher.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                  email: Faker::Internet.email, password: Faker::Internet.password(12))
end

250.times do
  Student.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                  grade: rand(9..12), gpa: rand(0..4).to_f, detentions: rand(1..10),
                  t_shirt_size: shirt_sizes.sample, teacher_id: rand(1..50))
end
