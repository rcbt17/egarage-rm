class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :transmission
      t.integer :seats
      t.boolean :air_conditioning
      t.integer :price_per_day
      t.string :class
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
