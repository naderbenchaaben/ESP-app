class Addfieldofbusiness < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :fieldofbusiness, :string
  end
end
