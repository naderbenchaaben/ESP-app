class Removingcategoryid < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :category_id
  end
end
