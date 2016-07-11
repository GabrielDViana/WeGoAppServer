class AddImagesToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :company_images, :string, array: true
  end
end
