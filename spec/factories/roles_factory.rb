FactoryBot.define do
  factory :role do
    sequence :name do |n|
      "Role #{n}"
    end
    billable { true }
  end
end
