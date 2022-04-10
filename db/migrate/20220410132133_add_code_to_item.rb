class AddCodeToItem < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :code, :string, default: ""
  end
end
