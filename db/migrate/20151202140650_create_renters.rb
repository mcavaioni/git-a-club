class CreateRenters < ActiveRecord::Migration
  def change
    create_table :renters do |t|
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
