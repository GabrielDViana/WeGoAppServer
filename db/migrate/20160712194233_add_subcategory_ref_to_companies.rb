class AddSubcategoryRefToCompanies < ActiveRecord::Migration
  def change
    add_reference :companies, :subcategory, index: true, foreign_key: true
    add_reference :companies, :category, index: true, foreign_key: true
  end
end
