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

    describe "not_managed_by" do
      it "returns all people (managers and employees alike) whose manager is not the passed in manager_id" do
        # managers
        manager_1 = create(
          :person,
          name: "Manager 1",
          manager_id: nil,
        )
        manager_2 = create(
          :person,
          name: "Manager 2",
          manager_id: nil,
        )
        manager_3 = create(
          :person,
          name: "Manager 3",
          manager_id: nil,
        )

        # employees
        employee_a = create(
          :person,
          name: "Employee A",
          manager: manager_1
        )
        employee_b = create(
          :person,
          name: "Employee B",
          manager: manager_2
        )
        employee_c = create(
          :person,
          name: "Employee C",
          manager: manager_2
        )
        employee_d = create(
          :person,
          name: "Employee D",
          manager: manager_3
        )

        # Not managed by manager 1
        results_1 = Person.not_managed_by(manager_1.id)

        expect(
          results_1.map(&:name)
        ).to match_array(
          [
            manager_1,
            manager_2,
            manager_3,
            employee_b,
            employee_c,
            employee_d,
          ].map(&:name),
        )
      end
    end
  end
end
