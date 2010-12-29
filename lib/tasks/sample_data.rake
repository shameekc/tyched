require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Adminstrator",
                 :email => "admin@tyched.com",
                 :password => "ohana123",
                 :password_confirmation => "ohana123")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "sample-#{n+1}@ohana-media.com"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end
