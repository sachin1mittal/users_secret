class DeviseCreateUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :encrypted_password, null: false, default: ""
      t.datetime :remember_created_at
    end

    add_index :users, :email,                unique: true
  end
end
