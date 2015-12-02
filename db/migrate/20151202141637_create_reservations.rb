class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :renter_profile_id
      t.datetime :start_date
      t.datetime :finish_date
      t.integer :listing_id

      t.timestamps null: false
    end
  end
end
