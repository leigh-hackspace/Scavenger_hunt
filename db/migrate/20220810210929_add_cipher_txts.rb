class AddCipherTxts < ActiveRecord::Migration[6.1]
  def change
    create_table :cipher_items do |t|
      t.string :cipher_text, default: ""
      t.string :clear_text, default: ""
      t.string :rotation, default: 26

      t.string :item_uuid, null: false

      t.timestamps
    end
  end
end
