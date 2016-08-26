class AddPictureAndDescriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :picture, :text
    add_column :users, :description, :string
    add_column :users, :phone, :string
  end
end
