class CreateHunters < ActiveRecord::Migration[6.1]
  def change
    create_table :hunters do |t|
      t.string :hunter_name

      t.timestamps
    end
  end
end
