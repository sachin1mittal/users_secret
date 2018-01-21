class CreateSecretCodes < ActiveRecord::Migration
  def change
    create_table :secret_codes do |t|
      t.string :code
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
