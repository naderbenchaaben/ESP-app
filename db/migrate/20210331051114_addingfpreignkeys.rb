class Addingfpreignkeys < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :company_id, :integer
    add_foreign_key :orders, :companies
    add_column :products, :category_id, :integer
    add_foreign_key :products, :categories
    add_column :categories, :company_id, :integer
    add_foreign_key :categories, :companies

  end
end
