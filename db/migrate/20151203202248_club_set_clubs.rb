class ClubSetClubs < ActiveRecord::Migration
  def change
    create_table :club_set_clubs do |t|
      t.integer :club_set_id
      t.integer :club_id

      t.timestamps null: false
    end
  end
end
