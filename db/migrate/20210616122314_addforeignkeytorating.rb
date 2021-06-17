class Addforeignkeytorating < ActiveRecord::Migration[6.0]
  def change
    add_column :ratings, :user_id, :integer
     add_column :ratings, :product_id, :integer
     add_foreign_key :order_items, :orders
     add_foreign_key :ratings, :users
     add_foreign_key :ratings, :products
  end
end
