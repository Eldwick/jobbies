class ChangeStatusInTask < ActiveRecord::Migration
  def change
    remove_column :tasks, :status, :string
    add_column :tasks, :pending, :boolean, default: true
  end
end
