class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name
      t.references :category, index: true, foreign_key: true

    end
  end
end
