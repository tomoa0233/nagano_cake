class Public::OrdersController < ApplicationController
  def new
   @order = Order.new
   @customer = current_customer
  end

  def confirm
    @postage = 800
    @cart_items = current_customer.cart_items
    @order = Order.new
    @order.payment_method = params[:order][:payment_method]
    if params[:order][:is_address] == "my_address"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:is_address] == "register_address"
      @address = Address.find(params[:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else params[:order][:is_address] == "new_address"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  def orderend
    #送られた情報を注文テーブルに格納。格納後、注文詳細テーブルに格納。カート内削除
    @order = Order.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      OrderDetail.create(item_id: cart_item.item_id, purchase_price: cart_item.item.price, amount: cart_item.amount, order_id: @order.id)
    end
    @cart_items.destroy_all
    redirect_to public_orders_thanks_path
  end

  def thanks
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @postage = 800
    @cart_items = current_customer.cart_items.all
    @order = Order.find(params[:id])
    @sum = 0
    @cart_items.each do |cart_item|
      @sum += cart_item.subtotal
    end
    @total = @sum + @postage
  end

  private

  def order_params
    params.require(:order).permit(:total_payment, :postage, :payment_method, :postal_code, :address, :name, :customer_id)
  end
end
