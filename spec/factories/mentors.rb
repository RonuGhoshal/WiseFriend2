require 'faker'

FactoryBot.define do
  factory :mentor do |f|
    f.first_name Faker::Name.first_name
    sequence :email do |n|
      "testuser#{n}@wisefriendmentors.com"
    end
    f.password Faker::Internet.password
  end

  factory :invalid_mentor, parent: :mentor do |f|
    f.first_name nil
  end

end
