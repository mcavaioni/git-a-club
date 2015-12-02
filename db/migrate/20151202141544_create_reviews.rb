class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :reviewable_type
      t.integer :reviewable_id
      t.string :content

      t.timestamps null: false
    end
       add_index :reviews, [:reviewable_id, :reviewable_type]
  end
end
