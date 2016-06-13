class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.integer :average_rating
      t.integer :distance
      t.float :latitude
      t.float :longitude
      t.timestamps null: false
    end
  end
end
