class Public::ShippingsController < ApplicationController
  def index
    @shipping=Shipping.new
    @shippings=Shipping.all

  end

  def edit
    @shipping=Shipping.find(params[:id])
  end

  def create
    @shipping=Shipping.new(shipping_params)
    @shipping.save!
    redirect_to public_shippings_path
  end

  def update
    @shipping=Shipping.find(params[:id])
    @shipping.update
    redirect_to public_shippings_path
  end

  def destroy
    @shipping=Shipping.find(params[:id])
    @shipping.destroy
    redirect_to public_shippings_path
  end

  private

  def shipping_params
    params.require(:shipping).permit(:name,:address,:zip_code)
  end
end
