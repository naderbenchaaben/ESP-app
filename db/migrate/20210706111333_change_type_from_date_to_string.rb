class ChangeTypeFromDateToString < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :order_pick_up_date, :string
    change_column :orders, :order_pick_up_time, :string
  end
end
