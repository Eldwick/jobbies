class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.integer :primary_phone
      t.integer :secondary_phone
      t.string :title
      t.integer :company_id

      t.timestamps
    end
  end
end
