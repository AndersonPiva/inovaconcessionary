class CreateOptionals < ActiveRecord::Migration
  def change
    create_table :optionals do |t|
      t.string :description
      t.references :vehicle, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
