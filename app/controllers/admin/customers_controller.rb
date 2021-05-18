class Admin::CustomersController < ApplicationController
  def index
    
    @customers = @customer.all
  end

  def show
    @customer = Customer.find(params[:id]) 
  end

  def edit
    @customer = Customer.find(params[:id]) 
  end

  def update
    @customer = Customer.find(params[:id]) 
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer)
  end
  
   private

  def customer_params
    params.require(:customer).permit(:id, :first_name, :secound_name, :first_name_alias, :secound_name_alias, :zip_code, :address, :tel_number, :email, :is_deleted)
  end

end
