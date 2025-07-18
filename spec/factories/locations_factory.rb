FactoryBot.define do
  factory :location do
    region
    sequence :name do |n|
      "Location #{n}"
    end
  end
end
