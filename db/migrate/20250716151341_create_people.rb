class CreatePeople < ActiveRecord::Migration[8.0]
  def change
    create_table :people do |t|
      t.string :name
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
