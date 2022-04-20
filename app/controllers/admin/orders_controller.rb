class Admin::OrdersController < ApplicationController
  def show
   @order = Order.find(params[:id])
   @order_details = @order.order_details
   # show/:idからid決まる　Order.find(params[:id])
   # @order_details = @order.order_details
   @sum = 0
   @order_details.each do |order_detail|
    @sum += order_detail.subtotal
  end
  @postage = 800
  @total = @sum + @postage
  end
end
