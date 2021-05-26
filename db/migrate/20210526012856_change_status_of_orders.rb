class ChangeStatusOfOrders < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :orders, :status, :string, default: '入金待ち'
    end

    def down
      change_column :orders, :status, :string
    end
  end
end
