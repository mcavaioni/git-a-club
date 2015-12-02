class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :listable_type
      t.integer :listable_id
      t.datetime :start_date
      t.datetime :finish_date
      t.integer :price
       
      t.timestamps null: false
    end
    add_index :listings, [:listable_id, :listable_type]
  end
end
