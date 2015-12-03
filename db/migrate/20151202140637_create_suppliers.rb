class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
