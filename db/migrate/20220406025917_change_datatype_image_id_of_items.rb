class ChangeDatatypeImageIdOfItems < ActiveRecord::Migration[6.1]
  def change
    change_column :items, :image_id, :string
  end
end
