class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details

  def delivery_fee
  end

 enum method_of_payment:{クレジットカード: 0, 銀行振込: 1}

 enum status:{入金待ち: 0, 入金確認: 1, 制作中: 2, 発送準備中: 3, 発送済み: 4 }

end
