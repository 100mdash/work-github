class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = CartItem.all
  end

  def create
    cart_item = current_customer.cart_item.new(cart_item_params)
    cart_item.save
  end

  def update
    cart_item = CartItem.find
    cart_item.update(count: params[:count].to_i)
    redirect_to current_cart
  end

  def destroy
    @cart_item.destroy
    redirect_to current_cart
  end

  def destroy_all
    @cart_item.destroy_all
  end
end
