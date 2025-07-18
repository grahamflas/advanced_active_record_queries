FactoryBot.define do
  factory :person do
    role
    location
    sequence :name do |n|
      "Person #{n}"
    end
  end
end
