class AddCapture < ActiveRecord::Migration[6.1]
  def change
    create_table :ghosts_hunters, id: false do |t|
      t.belongs_to :hunter
      t.belongs_to :ghost
    end
  end
end
