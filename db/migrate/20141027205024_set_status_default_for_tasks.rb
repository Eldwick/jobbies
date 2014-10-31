class SetStatusDefaultForTasks < ActiveRecord::Migration
  def change
    change_column_default :tasks, :status, "Not Started" 
  end
end
