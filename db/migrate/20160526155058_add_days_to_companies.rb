class AddDaysToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :days, :string, array:true
  end
end
