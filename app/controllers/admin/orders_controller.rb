class Admin::OrdersController < ApplicationController
  def show
    @orders = Order.all
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    #binding.pry
    @delivery_fee = 800
    @prducts = Item.page(params[:page]).per(2)
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
     @order.order_details.each do |f|
        if @order.status == "入金確認"
          f.update(making_status: "製作待ち")
        elsif
            @order.status == "発送済み"
             f.update(making_status: "発送済み")
        end
      end
    #binding.pry
    redirect_back fallback_location: root_path
  end

  private

  def order_params
  params.require(:order).permit(:shipping_zip_code,:shipping_address,:shipping_name,:delivery_fee,:total_price,:method_of_payment,:status)
  end
end
