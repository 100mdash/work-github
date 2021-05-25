class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page])
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @numbers = ((1..10).to_a)
  end
end
