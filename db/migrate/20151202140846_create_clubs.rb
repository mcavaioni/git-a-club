class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.integer :provider_profile_id
      t.integer :club_set_id
      t.string :type
      t.string :brand
      t.string :shaft_stiffness
      t.boolean :male
      t.boolean :righty
      t.string :feature
      t.string :condition
      t.integer :price

      t.timestamps null: false
    end
  end
end
