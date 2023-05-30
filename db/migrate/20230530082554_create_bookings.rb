class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.integer :total_days
      t.integer :total_price
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true
      t.timestamps
    end
  end
end
