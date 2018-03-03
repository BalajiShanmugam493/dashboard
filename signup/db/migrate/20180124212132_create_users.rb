class CreateUsers < ActiveRecord::Migration[5.1]
  devise :database_authenticatable, 
         :registerable,
         :recoverable,
         :rememberable, 
         :trackable,
         :validatable
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
