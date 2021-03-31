class Addrole < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :if_admin, :boolean, default: false
    add_column :users, :if_Topadmin, :boolean, default: false
    add_column :users, :if_client, :boolean, default: false
  end
end
