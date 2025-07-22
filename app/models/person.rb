class Person < ApplicationRecord
  belongs_to :role
  belongs_to :location

  belongs_to :manager,
    class_name: "Person",
    foreign_key: :manager_id,
    optional: true
  has_many :employees,
    class_name: "Person",
    foreign_key: :manager_id

  scope :billable, -> {
    joins(:role)
    merge(Role.billable)
  }

  scope :not_managed_by, -> (manager_id) {
    joins(:manager).
    where.
    not(managers_people: { id: manager_id })
  }
end
