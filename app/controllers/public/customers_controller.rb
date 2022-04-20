class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer.params)
    redirect_to public_customers_my_page(@customer)
  end

  def unsubscribe
  end

def customer_params
 params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :name_display, :name_kana_display, :postal_code, :address, :telephone_number, :email)
end

end
