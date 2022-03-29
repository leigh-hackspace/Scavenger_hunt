class AddAdminFlagToHunters < ActiveRecord::Migration[6.1]
  def change
    add_column :hunters, :isAdmin, :boolean, default: false
  end
end
