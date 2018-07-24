class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :email
      t.boolean :activated
      t.string :password_digest
      t.string :reset_digest
      t.string :reset_sent_at
      t.boolean :admin
      t.string :avatar

      t.timestamps
    end
  end
end
