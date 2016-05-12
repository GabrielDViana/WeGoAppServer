class AddImagesToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :company_images, :text, array: true, default: '{}'
  end
end
