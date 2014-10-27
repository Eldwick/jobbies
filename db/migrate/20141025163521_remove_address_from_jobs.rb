class RemoveAddressFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :street_address, :string
    remove_column :jobs, :city, :string
    remove_column :jobs, :state, :string
    remove_column :jobs, :zip_code, :integer
  end
end
