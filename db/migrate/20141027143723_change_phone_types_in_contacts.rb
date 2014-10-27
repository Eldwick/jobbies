class ChangePhoneTypesInContacts < ActiveRecord::Migration
  def change
    change_column :contacts, :primary_phone, :bigint
    change_column :contacts, :secondary_phone, :bigint
  end
end
