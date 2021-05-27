class AddingComppanyIdToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :order_id, :integer
    add_foreign_key :products, :orders
  end
end
