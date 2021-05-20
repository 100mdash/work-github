class Admin::HomesController < ApplicationController

  def top
    if request.referer.include?("admin/customer/:id") 
      @orders = Order.find(params[:id])
    else
      @orders = Order.all
    end
  end
  
end
