class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end


  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to public_customers_path(current_customer)

    else
      render "edit"
    end

  end

  def unsubscribe
   # @customer = Customer.find(params[:id])
  end

  def withdraw
     @customer = current_customer
     @customer.update(is_deleted: "Invalid")
    reset_session
    redirect_to root_path
  end
private

  def customer_params
    params.require(:customer).permit(:email, :first_name, :secound_name, :first_name_alias, :secound_name_alias, :zip_code, :address, :tel_number, :is_deleted)
  end

end
