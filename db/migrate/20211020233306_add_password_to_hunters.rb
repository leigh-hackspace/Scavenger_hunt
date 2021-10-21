class AddPasswordToHunters < ActiveRecord::Migration[6.1]
  def change
    add_column :hunters, :password_digest, :string
  end
end
