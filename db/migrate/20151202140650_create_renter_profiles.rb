class CreateRenterProfiles < ActiveRecord::Migration
  def change
    create_table :renter_profiles do |t|
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
