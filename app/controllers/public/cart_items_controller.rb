class Public::CartItemsController < ApplicationController

  def index

    @cart_items = CartItem.all
    @numbers = ((1..10).to_a)
  end

  def create
    cart_item = current_customer.cart_items.new(cart_item_params)
    cart_item.save
    redirect_to public_cart_items_path

  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(count: params[:count].to_i)
    redirect_to current_cart
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_back fallback_location: root_path
  end

  def destroy_all
    @cart_item.destroy_all
  end

  private

 def cart_item_params
   params.require(:cart_item).permit(:item_id,:count)
 end
 
 

end
