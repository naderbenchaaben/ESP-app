class Company < ApplicationRecord
    has_many :orders
    has_many :images
    has_many :products

end
