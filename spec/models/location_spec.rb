require "rails_helper"

RSpec.describe Location, type: :model do
  describe "scopes" do
    describe "#billable" do
      it "returns a list of distinct locations that have billable people" do
        billable_location_1 = create(:location, name: "Billable Location 1")
        billable_location_2 = create(:location, name: "Billable Location 2")
        non_billable_location = create(:location, name: "Non-billable Location")

        billable_role = create(:role, name: "Billable Role", billable: true)
        non_billable_role = create(:role, name: "Non-billable Role", billable: false)

        _billable_person_1 = create(
          :person,
          role: billable_role,
          location: billable_location_1,
        )

        _billable_person_2 = create(
          :person,
          role: billable_role,
          location: billable_location_2,
        )
        _billable_person_3 = create(
          :person,
          role: billable_role,
          location: billable_location_2,
        )

        _non_billable_person = create(
          :person,
          role: non_billable_role,
          location: non_billable_location,
        )

        results = Location.billable

        expect(results).to match_array([
          billable_location_1,
          billable_location_2,
        ])

        expect(results).not_to include(non_billable_location)
      end
    end
  end
end
