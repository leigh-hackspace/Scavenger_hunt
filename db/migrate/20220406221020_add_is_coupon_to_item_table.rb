class AddIsCouponToItemTable < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :is_coupon, :boolean, default: false
  end
end
