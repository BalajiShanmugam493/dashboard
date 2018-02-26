class AddAccessionIdToItemdetails < ActiveRecord::Migration[5.1]
  def change
    add_column :itemdetails, :accessionId, :string
  end
end
