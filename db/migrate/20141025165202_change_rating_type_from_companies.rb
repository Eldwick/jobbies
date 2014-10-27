class ChangeRatingTypeFromCompanies < ActiveRecord::Migration
  def change
    change_column :companies, :rating, :float
  end
end
