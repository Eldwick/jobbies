class SetStatusDefaultForApplication < ActiveRecord::Migration
  def change
    change_column_default :applications, :status, "Pending" 
  end
end
