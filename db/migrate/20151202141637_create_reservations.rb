class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :renter_id
      t.date :start_date
      t.date :finish_date
      t.integer :listing_id

      t.timestamps null: false
    end
  end
end
