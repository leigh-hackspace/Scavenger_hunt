class AddEmailToHunters < ActiveRecord::Migration[6.1]
  def change
    add_column :hunters, :email, :string, default: "info@leighhack.org"
  end
end
