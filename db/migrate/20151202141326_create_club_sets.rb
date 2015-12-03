class CreateClubSets < ActiveRecord::Migration
  def change
    create_table :club_sets do |t|
      t.string :summary
      t.string :name
      t.string :picture

      t.timestamps null: false
    end
  end
end
