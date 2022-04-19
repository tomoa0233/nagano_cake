class Public::HomesController < ApplicationController
  def top
   @item = Item.new
   @item_latest4 = Item.first(4)
  end

  def about
  end

end
