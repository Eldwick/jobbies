class RenameActionsToTasks < ActiveRecord::Migration
  def change
    rename_table :actions, :tasks
  end
end
