class Item < ApplicationRecord
  attachment :image
  belongs_to :genre
  def add_tax_price
    (self.price * 1.1).round
  end

  has_many :cart_items, dependent: :destroy

end
