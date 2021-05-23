class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    @numbers = ((1..10).to_a)
  end

  def create
    @cart_item = CartItem.find_by(customer_id: current_customer.id, item_id: params[:cart_item][:item_id].to_i )

    if @cart_item.blank?
      @cart_item = current_customer.cart_items.new(cart_item_params)
    else
      #p @cart_item
      @cart_item.count += params[:cart_item][:count].to_i
    end
     #p @cart_item
      @cart_item.save
      redirect_to public_cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_back fallback_location: root_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_back fallback_location: root_path
  end

  def destroy_all
    @cart_item = current_customer.cart_items
    CartItem.destroy_all
    redirect_back fallback_location: root_path
  end

  private

 def cart_item_params
   params.require(:cart_item).permit(:item_id,:count)
 end

end
