require 'rails_helper'

RSpec.describe Person, type: :model do
  describe "scopes" do
    describe "billable" do
      it "returns people whose role is billable" do
        developer = create(
          :role,
          name: "Developer",
          billable: true,
        )
        manager = create(
          :role,
          name: "Manager",
          billable: false,
        )

        billable_person_1 = create(:person, role: developer)
        billable_person_2 = create(:person, role: developer)
        non_billable_person = create(:person, role: manager)

        result = Person.billable

        expect(result).to match_array([billable_person_1, billable_person_2])
        expect(result).not_to include(non_billable_person)
      end
    end
  end
end
