class CreateTables < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :body
      t.string :item_uuid, null: false

      t.timestamps
    end

    create_table :hunters do |t|
      t.string :hunter_name
      t.timestamps
    end

    add_column :hunters, :password_digest, :string
    add_column :hunters, :hunter_uuid, :string
  
  end
end
