class Admin::ItemsController < ApplicationController
  def index
    @items=Item.all
  end

  def new
    @item=Item.new
  end

  def create
    item=Item.find(item_params)
    item.save
    redirect_to item_path(item.id)
  end

  def show
    @item=Item.find(params[:id])
  end

  def edit
    @item=Item.find(params[:id])
  end

  def update
    @item=Item.find(params[:id])
    @item.update
    redirect_to item_path(@item.id)
  end

private

 def item_params
   params.require(:item).permtit(:name,:image,:introduction,:price,:genre,:is_active)
 end 
end
