class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :title
      t.float :value
      t.text :description
      t.integer :year
      t.string :promotion
      t.string :transmission
      t.string :fuel
      t.string :color
      t.float :km
      t.references :model, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
