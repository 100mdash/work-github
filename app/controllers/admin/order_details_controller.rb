class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    @order_details = @order.order_details
    count = 0
    if @order_detail.making_status == "製作中"
          @order.update(status: "製作中")
    end
    @order_details.each do |order_detail|
    if order_detail.making_status == "製作完了"
      count += 1
    end
  end
  if count == @order_details.count
    @order.update(status: "発送準備中")
  end


    #binding.pry
    redirect_to admin_path(@order)
    #redirect_back fallback_location: root_path
  end

  private
  def order_detail_params
  params.require(:order_detail).permit(:making_status)
  end
end
