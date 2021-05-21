class Admin::OrdersController < ApplicationController
  def show
    @orders = Order.all
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[id])
    order.update(order_params)
    redirect_back(fallback_location: root_path)
  end
end
