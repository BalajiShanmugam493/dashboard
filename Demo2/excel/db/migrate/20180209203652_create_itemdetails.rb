class CreateItemdetails < ActiveRecord::Migration[5.1]
  def change
    create_table :itemdetails do |t|
      t.integer :itemID
      t.date :Date
      t.string :accessionItemNo
      t.string :journalSequence
      t.string :publicationYear
      t.string :documentType
      t.string :pageSpan

      t.timestamps
    end
  end
end
