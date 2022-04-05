class FixIsAdminColumName < ActiveRecord::Migration[6.1]
  def change
    rename_column :hunters, :isAdmin, :is_admin
  end
end
