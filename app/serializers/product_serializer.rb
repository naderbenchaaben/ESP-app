class ProductSerializer < ActiveModel::Serializer
  attributes :id
  include Rails.application.routes.url_helpers
 
  product_name, :ref_product, :description, :shortDesc, :category_id, :available_quantity, :images

  def images 
    if object.images.attached?
      {
        url: rails_blob_url(object.images)
      }
    end
  end
end
