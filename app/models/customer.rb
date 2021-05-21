class Customer < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :shippings, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def change
    add_column :customers, :is_deleted, :boolean, default: true, null: false
  end

end
