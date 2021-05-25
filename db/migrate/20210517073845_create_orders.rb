class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :shipping_zip_code
      t.string :shipping_address
      t.string :shipping_name
      t.integer :delivery_fee
      t.integer :total_price
      t.integer :method_of_payment
      t.integer :status, default: "入金待ち"

      t.timestamps
    end
  end
end
