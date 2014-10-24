class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :average_pay
      t.text :description
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.text :qualifications
      t.integer :zip_code
      t.integer :company_id

      t.timestamps
    end
  end
end
