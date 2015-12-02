class CreateGenericClubs < ActiveRecord::Migration
  def change
    create_table :generic_clubs do |t|
      t.string :type
      t.string :brand
      t.boolean :male
      t.boolean :righty
      t.string :head_feature
      t.string :shaft_stiffness

      t.timestamps null: false
    end
  end
end
