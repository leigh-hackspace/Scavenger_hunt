class Add < ActiveRecord::Migration[6.1]
  def change
	add_column :hunters, :hunter_uuid, :string
  end
end
