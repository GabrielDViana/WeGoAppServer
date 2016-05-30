class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rate
      t.belongs_to :user, index: true
      t.belongs_to :company, index: true
    end
  end
end
