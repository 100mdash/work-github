class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  has_many :order_details, dependent: :destroy
  belongs_to :customer

  def delivery_fee
  end

 enum method_of_payment:{クレジットカード: 0, 銀行振込: 1}

end
