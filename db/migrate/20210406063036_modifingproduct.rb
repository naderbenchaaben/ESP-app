class Modifingproduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :shortDesc, :string
  end
end
