class Order < ApplicationRecord
has_many :orderItem ,dependent: :destroy 

end
