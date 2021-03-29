class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :ref_product
      t.float  :price
      t.string :description
      t.integer :available_quantity

      t.timestamps
    end
  end
end
