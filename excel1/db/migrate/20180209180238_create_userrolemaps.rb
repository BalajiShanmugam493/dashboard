class CreateUserrolemaps < ActiveRecord::Migration[5.1]
  def change
    create_table :userrolemaps do |t|
      t.integer :userMapRoleID
      t.integer :mapUserID
      t.integer :mapRoleID

      t.timestamps
    end
  end
end
