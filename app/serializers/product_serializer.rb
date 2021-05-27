class ProductSerializer < ActiveModel::Serializer
 

include Rails.application.routes.url_helpers
  attributes :id ,:product_name, :price, :ref_product, :description,  :category_id, :available_quantity
end