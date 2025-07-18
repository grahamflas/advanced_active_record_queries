class Location < ApplicationRecord
  belongs_to :region
  has_many :people

  scope :billable, -> {
    joins(people: :role).
      merge(Person.billable).
      distinct
  }
end
