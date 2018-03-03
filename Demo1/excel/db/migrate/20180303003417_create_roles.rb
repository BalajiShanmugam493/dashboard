class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.integer :roleID
      t.integer :queueStatusID
      t.string :roleName

      t.timestamps
    end
  end
end
