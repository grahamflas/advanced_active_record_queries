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

  scope :not_managed_by, ->(manager_id) {
    joins(<<-SQL).
      LEFT JOIN people managers
        ON managers.id = people.manager_id
    SQL
    where(
      "managers.id != ? OR people.manager_id IS NULL",
      manager_id,
    )
  }
end
