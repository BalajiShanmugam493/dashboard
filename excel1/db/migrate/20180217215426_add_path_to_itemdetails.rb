class AddPathToItemdetails < ActiveRecord::Migration[5.1]
  def change
    add_column :itemdetails, :path, :string
  end
end
