class CreateGroupBills < ActiveRecord::Migration
  def change
    create_table :group_bills do |t|
      t.string :month
      t.text :observations

      t.timestamps
    end
  end
end
