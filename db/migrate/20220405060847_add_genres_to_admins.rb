class AddGenresToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :name, :string, default:false
  end
end
