class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.timestamps null: false
      t.string :id_social
      t.string :token
      t.string :password_digest
      t.string :password_reset_key
      t.datetime :password_reset_sent_at
    end
  end
end
