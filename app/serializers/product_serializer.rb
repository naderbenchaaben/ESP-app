class ProductSerializer < ActiveModel::Serializer
 

include Rails.application.routes.url_helpers
  attributes :id ,:product_name, :price, :ref_product, :description,  :category_id, :available_quantity, :image , :company_id
end