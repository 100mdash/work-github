class Customer < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :shippings, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def change
    add_column :customers, :is_deleted, :boolean, default: true, null: false
  end
  validates :first_name, presence: true
  validates :secound_name, presence: true
  validates :first_name_alias, presence: true
  validates :secound_name_alias, presence: true
  validates :zip_code, length: {is: 7}
  validates :address, presence: true
  validates :tel_number, presence: true, numericality: { only_integer: true }
  validates :encrypted_password, presence: true, length: {minimum: 6}
  validates :email, presence: true

end
