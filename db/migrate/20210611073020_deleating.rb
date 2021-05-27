class Deleating < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :shortDesc
  end
end
