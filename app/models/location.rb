class Location < ApplicationRecord
  belongs_to :region
  has_many :people

  scope :billable, -> {
    joins(people: :role).
      merge(Person.billable).
      distinct
  }

  scope :by_region_name_and_location_name, -> {
    joins(:region).
      merge(Region.order(:name)).
      order(:name)
  }
end
