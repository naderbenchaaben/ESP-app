class AddingFieldsToOrderItem < ActiveRecord::Migration[6.0]
  def change
    add_column :order_items, :order_id, :integer
     add_column :order_items, :product_id, :integer
     add_column :order_items, :quantity, :integer
     add_column :order_items, :order_item_price, :float 
     add_foreign_key :order_items, :orders
  end
end
