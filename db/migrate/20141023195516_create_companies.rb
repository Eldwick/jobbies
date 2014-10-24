class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :num_employees
      t.integer :rating
      t.string :category

      t.timestamps
    end
  end
end
