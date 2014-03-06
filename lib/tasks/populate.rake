require 'ffaker'

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    10.times do |n|
      puts "[DEBUG] creating post #{n+1} of 10"
      title = Faker::Lorem.sentence(7)
      body = Faker::Lorem.paragraph(17)

      Post.create!(title: title, body: body)
    end
  end
end
