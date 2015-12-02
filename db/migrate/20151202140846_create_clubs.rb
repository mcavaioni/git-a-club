class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.integer :provider_id
      t.integer :club_set_id
      t.integer :generic_club_id
      t.string :condition

      t.timestamps null: false
    end
  end
end
