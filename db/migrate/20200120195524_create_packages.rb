class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.datetime :start_date
      t.datetime :finish_date
      t.string :title, null: false
      t.boolean :finished, default: false
      t.boolean :publish, default: false
      t.string :slug

      t.timestamps
    end
    add_index :packages, :slug, unique: true
  end
end
