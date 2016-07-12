FactoryGirl.define do
  factory :mentor do |f|
    f.first_name "Karl"
    f.email "Karl@karlton.com"
    f.password "heisenberg"
  end

  factory :invalid_mentor, parent: :mentor do |f|
    f.first_name nil
  end

end