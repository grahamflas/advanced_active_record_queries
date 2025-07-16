class Person < ApplicationRecord
  belongs_to :role

  scope :billable, -> {
    joins(:role).
    merge(Role.billable)
  }
end
