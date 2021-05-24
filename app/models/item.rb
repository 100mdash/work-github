class Item < ApplicationRecord
  attachment :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  def add_tax_price
    (self.price * 1.1).round
  end

 

  validates :name, presence: true, uniqueness: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
end
