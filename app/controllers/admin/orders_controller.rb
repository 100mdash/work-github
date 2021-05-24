class Admin::OrdersController < ApplicationController
  def show
    @orders = Order.all
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @delivery_fee = 800
    @prducts = Item.page(params[:page]).per(2)
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_back fallback_location: root_path
  end
  
  private
  
  def order_params
  params.require(:order).permit(:shipping_zip_code,:shipping_address,:shipping_name,:delivery_fee,:total_price,:method_of_payment,:status)
  end
end
