class AddingtoUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :if_Topadmin, :boolean, default:false
    add_column :users, :if_client, :boolean, default:true
    add_column :users, :if_admin, :boolean, default:true
    add_column :users, :firstname, :string 
    add_column :users, :lastname, :string
    add_column :users, :companyname, :string
    add_column :users, :fieldofbusiness, :string
    add_column :users, :city, :string
  end
end
