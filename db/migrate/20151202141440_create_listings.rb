class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :listable_type
      t.integer :listable_id
      t.date :start_date
      t.date :finish_date
      t.integer :price
      t.boolean :active, default: true

      t.timestamps null: false
    end
    add_index :listings, [:listable_id, :listable_type]
  end
end
