class ChangeNumEmployeesTypeInCompanies < ActiveRecord::Migration
  def change
    change_column :companies, :num_employees, :string
  end
end
