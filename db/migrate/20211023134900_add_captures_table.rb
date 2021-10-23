class AddCapturesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :captures do |t|
      t.belongs_to :ghost
      t.belongs_to :patient
      t.timestamps
    end
  end
end
