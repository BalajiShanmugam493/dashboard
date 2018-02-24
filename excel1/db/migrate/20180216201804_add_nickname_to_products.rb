class AddNicknameToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :nickname, :string
  end
end
