class Addingtelnumtousers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :telnum, :integer
    
  end
end
