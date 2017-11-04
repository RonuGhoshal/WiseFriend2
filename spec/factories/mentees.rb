require 'faker'

FactoryBot.define do
  factory :mentee do |f|
    f.first_name Faker::Name.first_name
    f.last_name Faker::Name.last_name
    sequence :email do |n|
      "testuser#{n}@wisefriendmentees.com"
    end
    f.password Faker::Internet.password
  end

  factory :invalid_mentee, parent: :mentee do |f|
    f.first_name nil
  end

end
