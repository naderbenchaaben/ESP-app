class FinxingUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :if_admin, :boolean
    add_column :users, :if_Topadmin, :boolean
    add_column :users, :if_client, :boolean
    add_column :users, :companyname, :string
    add_column :users, :fieldofbusiness, :string
    add_column :users, :city, :string
  end
end
