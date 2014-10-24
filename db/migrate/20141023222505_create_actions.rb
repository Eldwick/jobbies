class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :status
      t.datetime :due_date
      t.text :notes_before
      t.text :notes_after
      t.integer :contact_id
      t.integer :application_id
      t.integer :user_id

      t.timestamps
    end
  end
end
