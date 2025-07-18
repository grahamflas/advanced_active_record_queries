require 'rails_helper'

RSpec.describe Role, type: :model do
  describe "scopes" do
    describe "billable" do
      it "returns roles that are billable" do
        billable_1 = create(:role, billable: true)
        billable_2 = create(:role, billable: true)
        non_billable = create(:role, billable: false)

        result = Role.billable

        expect(result).to match_array([
          billable_1,
          billable_2
        ])

        expect(result).not_to include(non_billable)
      end
    end
  end
end
