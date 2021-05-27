class OrderItemSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :product_id, :quantity, :order_item_price
end
