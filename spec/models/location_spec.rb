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

    describe "#by_region_name_and_location_name" do
      it "returns locations ordered by region name, then location name" do
        region_c = create(:region, name: "c")
        region_b = create(:region, name: "b")
        region_a = create(:region, name: "a")

        location_9 = create(:location, name: "9", region: region_c)
        location_8 = create(:location, name: "8", region: region_b)
        location_7 = create(:location, name: "7", region: region_a)
        location_6 = create(:location, name: "6", region: region_c)
        location_5 = create(:location, name: "5", region: region_b)
        location_4 = create(:location, name: "4", region: region_a)
        location_3 = create(:location, name: "3", region: region_c)
        location_2 = create(:location, name: "2", region: region_b)
        location_1 = create(:location, name: "1", region: region_a)

        results = Location.by_region_name_and_location_name

        expect(results).to eq([
          location_1,
          location_4,
          location_7,
          location_2,
          location_5,
          location_8,
          location_3,
          location_6,
          location_9,
        ])
      end
    end
  end
end
