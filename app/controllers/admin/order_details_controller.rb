class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    redirect_to admin_path(@order)
    #redirect_back fallback_location: root_path
  end
  
  private
  def order_detail_params
  params.require(:order_detail).permit(:making_status)
  end
end