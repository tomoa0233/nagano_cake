class Public::ItemsController < ApplicationController
 def show
   @item = Item.find(params[:id])
   @cart_item = CartItem.new
 end

 def index
   @items = Item.paginate(page: params[:page], per_page: 10)
 end

end
