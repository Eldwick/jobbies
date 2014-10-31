class ChangeStatusDefaultForApplication < ActiveRecord::Migration
  def change
    change_column_default :applications, :status, "Not Started" 
  end
end
