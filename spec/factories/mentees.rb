FactoryBot.define do
  factory :mentee do |f|
    f.first_name "Karl"
    f.last_name "Karlton"
    f.email "Karl@karlton.com"
    f.password "heisenberg"
  end

  factory :invalid_mentee, parent: :mentee do |f|
    f.first_name nil
  end

end