class Addingfieldsforegnkeystocomment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :user_id, :integer
     add_column :comments, :product_id, :integer
     add_foreign_key :comments, :users
     add_foreign_key :comments, :products

  end
end
