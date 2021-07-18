class Product < ApplicationRecord
    
    def change_stock(id,quantity)
        product = Product.where("id = ?  ", id )
        product.update(
          available_quantity: available_quantity - quantity
        )
      end
end
