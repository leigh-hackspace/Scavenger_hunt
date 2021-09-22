class CreateGhosts < ActiveRecord::Migration[6.1]
  def change
    create_table :ghosts do |t|
      t.string :title
      t.text :body
      t.string :ghost_uuid, null: false

      t.timestamps
    end
  end
end
