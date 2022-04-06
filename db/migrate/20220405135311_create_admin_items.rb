class CreateAdminItems < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_items do |t|

      t.timestamps
    end
  end
end
