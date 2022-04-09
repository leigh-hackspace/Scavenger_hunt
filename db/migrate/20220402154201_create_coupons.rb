class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.string :coupon_code
      t.boolean :is_claimed, :boolean, default: false
      t.string :item_id

      t.timestamps
    end

  end
end
