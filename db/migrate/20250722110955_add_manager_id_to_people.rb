class AddManagerIdToPeople < ActiveRecord::Migration[8.0]
  def change
    add_reference :people, :manager, foreign_key: { to_table: :people }, null: true
  end
end
