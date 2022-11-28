class AddImageToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :image_path, :string, default: ""

  end
end
