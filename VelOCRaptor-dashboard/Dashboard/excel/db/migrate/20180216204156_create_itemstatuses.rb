class CreateItemstatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :itemstatuses do |t|
      t.integer :itemStatusID
      t.integer :itemID
      t.integer :userID
      t.datetime :startTime
      t.datetime :endTime

      t.timestamps
    end
  end
end
