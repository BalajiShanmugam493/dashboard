class CreateItemqueuedetails < ActiveRecord::Migration[5.1]
  def change
    create_table :itemqueuedetails do |t|
      t.integer :itemQueueDetailsID
      t.integer :itemID
      t.integer :queueStatusID
      t.integer :userID
      t.string :status

      t.timestamps
    end
  end
end
