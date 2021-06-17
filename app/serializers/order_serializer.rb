class OrderSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
<<<<<<< HEAD
  attributes :id, :order_type,  :total_price, :company_id, :stage, :order_shipping_address, :order_pick_up_time, :user_id
=======
  attributes :id,  :total_price, :company_id, :stage, :order_shipping_address, :order_pick_up_time, :user_id
>>>>>>> bc8c08c94c2131aabe9e2e636a2a398990f1110a
end
