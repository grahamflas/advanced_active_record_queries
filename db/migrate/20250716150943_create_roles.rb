class CreateRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.boolean :billable

      t.timestamps
    end
  end
end
