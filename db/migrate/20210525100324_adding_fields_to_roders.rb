class AddingFieldsToRoders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :stage, :string
    add_column :orders, :order_shipping_address, :string
    add_column :orders, :order_pick_up_date, :date
    add_column :orders, :order_pick_up_time, :time
    add_column :orders, :user_id, :integer





  end
end
