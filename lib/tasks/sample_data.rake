namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "A User",
                 email: "auser@org.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
    (1..100).each do |n|
      name  = Faker::Name.name
      email = "#{n}#{n}#{n}@org.org"
      password  = "#{n}foobar"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end