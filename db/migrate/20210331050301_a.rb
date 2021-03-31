class A < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :if_admin
    remove_column :users, :if_client
    remove_column :users, :if_Topadmin
  end
end
