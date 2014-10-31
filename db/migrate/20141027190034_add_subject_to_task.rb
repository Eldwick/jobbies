class AddSubjectToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :subject, :string
  end
end
