class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :mapRoleID 
      t.string :username
      t.string :encrypted_password 
      t.string :salt
      t.timestamps
    end
  end
end
