class CreateGolfSets < ActiveRecord::Migration
  def change
    create_table :golf_sets do |t|
      t.string :summary
      t.string :name
      t.integer :price

      t.timestamps null: false
    end
  end
end
