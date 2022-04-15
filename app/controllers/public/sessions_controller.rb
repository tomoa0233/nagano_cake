class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]

protected

def customer_state
 @customer = Customer.find_by(email: params[:customer][:email])
 return if !@customer
 if @customer.valid_password?(params[:customer][:password])
   if @customer.is_active == false
     redirect_to new_customer_registration_path
   end
 end
end

end
