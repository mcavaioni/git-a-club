class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :provider
      t.string :uid
      t.string :address
      t.string :email
      t.string :phone_number
      t.string :password_digest
      t.string :picture

      t.timestamps null: false
    end
  end
end
