FactoryBot.define do
  factory :mentor do
    first_name Faker::Name.first_name
    sequence :email do |n|
      "testuser#{n}@wisefriendmentors.com"
    end
    type "Mentor"
  end

  factory :mentee do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    sequence :email do |n|
      "testuser#{n}@wisefriendmentees.com"
    end
    type "Mentee"
  end
end
