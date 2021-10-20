class AddCaptureTable < ActiveRecord::Migration[6.1]
  def change
	create_table :captures do |t|
		t.string :hunter_uuid
		t.string :ghost_uuid

		t.timestamps
    end
  end
end
