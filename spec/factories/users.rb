FactoryBot.define do
  factory :user do |u|
    factory :mentor do
      first_name Faker::Name.first_name
      sequence :email do |n|
        "testuser#{n}@wisefriendmentors.com"
      end
      password Faker::Internet.password
      type "Mentor"
    end

    factory :invalid_mentor do
      first_name nil
    end

    factory :mentee do
      first_name Faker::Name.first_name
      last_name Faker::Name.last_name
      sequence :email do |n|
        "testuser#{n}@wisefriendmentees.com"
      end
      password Faker::Internet.password
      type "Mentee"
    end

    factory :invalid_mentee, parent: :mentee do
      first_name nil
    end

  end
end
