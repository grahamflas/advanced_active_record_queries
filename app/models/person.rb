class Person < ApplicationRecord
  belongs_to :role
  belongs_to :location

  scope :billable, -> {
    joins(:role)
    merge(Role.billable)
  }
end
