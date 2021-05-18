class Item < ApplicationRecord
  def add_tax_price
    (self.price * 1.1).round
  end
end
