class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

 def add_tax_price
    (self.price * 1.1).round
 end
  def total_price
   cart_items.to_a.sum { |item| item.total_price }
  end
end
