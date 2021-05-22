class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @shipping = Shipping.where(customer: current_customer)
  end

  def confilm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.delivery_fee = 800
    if params[:address_selection] == "0"
      @order.shipping_address = current_customer.address
      @order.shipping_zip_code = current_customer.zip_code
      @order.shipping_name = current_customer.first_name + current_customer.secound_name
    elsif params[:address_selection] == "1"
      shipping_address = Shipping.find(params[:order][:shipping_id])
      @order.shipping_address = shipping_address.address
      @order.shipping_zip_code = shipping_address.zip_code
      @order.shipping_name = shipping_address.name
    else
      @order.shipping_zip_code = params[:order][:shipping_zip_code]
      @order.shipping_address = params[:order][:shipping_address]
      @order.shipping_name = params[:order][:shipping_name]
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |f|
      @order_details = @order.order_details.new
      @order_details.item_id = f.item.id
      #@order_details.name = f.item.name
      @order_details.current_price = f.item.price
      @order_details.count = f.count
      @order_details.save
    end
    @cart_items.destroy_all
    render public_orders_complete_path
  end

  def complete


  end

  def index
    @orders =current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @orders = @order.all

  end

  private

 def order_params
   params.require(:order).permit(:id,:customer_id,:shipping_zip_code,:shipping_address,:shipping_name,:delivery_fee,:total_price,:method_of_payment,:status)
 end


end
