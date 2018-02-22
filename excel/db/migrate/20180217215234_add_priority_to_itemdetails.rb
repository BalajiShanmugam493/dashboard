class AddPriorityToItemdetails < ActiveRecord::Migration[5.1]
  def change
    add_column :itemdetails, :priority, :integer
  end
end
