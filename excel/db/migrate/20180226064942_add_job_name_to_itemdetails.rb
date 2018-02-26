class AddJobNameToItemdetails < ActiveRecord::Migration[5.1]
  def change
    add_column :itemdetails, :jobName, :string
  end
end
