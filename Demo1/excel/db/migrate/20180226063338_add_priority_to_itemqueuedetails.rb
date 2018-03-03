class AddPriorityToItemqueuedetails < ActiveRecord::Migration[5.1]
  def change
    add_column :itemqueuedetails, :priority, :integer
  end
end
