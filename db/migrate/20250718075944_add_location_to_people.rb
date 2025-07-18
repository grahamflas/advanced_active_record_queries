class AddLocationToPeople < ActiveRecord::Migration[8.0]
  def change
    add_reference :people, :location, null: false, foreign_key: true
  end
end
