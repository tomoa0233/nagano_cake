class AddColumnToCartItem < ActiveRecord::Migration[6.1]
  def up
    add_column :cart_items, :customer_id, :integer
    add_column :cart_items, :item_id, :integer
  end

  def down
    remove_column :cart_items, :customer_id, :integer
    remove_column :cart_items, :item_id, :integer
  end
end
