class RemovingOrderidFromProduct < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :order_id
    add_column :products, :company_id, :integer
    add_foreign_key :products, :companies
  end
end
