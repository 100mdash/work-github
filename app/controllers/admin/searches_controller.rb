class Admin::SearchesController < ApplicationController
  def search
    @customers = Customer.looks(params[:search], params[:word])
  end
  
  def finder
    @items = Item.looks(params[:search], params[:word])
  end

end
