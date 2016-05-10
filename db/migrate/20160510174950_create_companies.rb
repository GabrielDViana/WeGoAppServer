class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :description
      t.string :adress
      t.float :latitude
      t.float :longitude
      t.boolean :operating_now
      t.time :time_opens
      t.time :time_closes
      t.string :token
      
      t.timestamps null: false
    end
  end
end
