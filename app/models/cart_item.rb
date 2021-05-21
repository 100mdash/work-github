class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

def syoukei
    (item.price * count * 1.1).floor
end


end
