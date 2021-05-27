class OrderSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id,  :total_price, :company_id, :stage, :order_shipping_address, :order_pick_up_time, :user_id
end
