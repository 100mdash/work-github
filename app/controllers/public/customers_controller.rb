class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end


  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to public_customers_path(current_customer)
  end

  def unsubscribe
  end

  def withdraw
     @customer = current_customer
     @customer.update(is_deleted: false)
    reset_session
    redirect_to root_path
  end
private

  def customer_params
    params.require(:customer).permit(:email, :first_name, :secound_name, :first_name_alias, :secound_name_alias, :zip_code, :address, :tel_number, :is_deleted)
  end

end
