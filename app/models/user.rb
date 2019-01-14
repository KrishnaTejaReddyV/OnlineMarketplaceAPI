class User < ApplicationRecord
    # Defining has_many relation with cart and purchased items
    has_many :cart_items
    has_many :purchased_items
end
