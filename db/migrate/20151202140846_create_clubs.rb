class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.integer :supplier_id
      t.integer :generic_club_id
      t.string :condition
      t.string :picture
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
