class CartItem < ApplicationRecord
    # Defining belongs to relation with user
    belongs_to :user
end
