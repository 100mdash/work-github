class OrderDetail < ApplicationRecord

  belongs_to :order, dependent: :destroy
  belongs_to :item, dependent: :destroy

  belongs_to :order
  belongs_to :item
  

end
