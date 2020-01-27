class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.references, :team
      t.references, :package
      t.integer, :position
      t.boolean, :started
      t.boolean, :finished
      t.string :comment,
      t.integer, :time_unit
      t.string :time_type

      t.timestamps
    end
  end
end
