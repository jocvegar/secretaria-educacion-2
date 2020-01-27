class AddTimeToAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :time_unit, :integer
    add_column :assignments, :time_type, :string
  end
end
