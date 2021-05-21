class Foreignkeycompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :user_id, :integer
    add_foreign_key :companies, :users
  end
end
