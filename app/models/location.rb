class Location < ApplicationRecord
  belongs_to :region
  has_many :people

  scope :billable, -> {
    joins(people: :role).
      where(role: { billable: true }).
      distinct
  }
end
